#!/home/cod/bin/python

##################################################################
##                                                              ##
## - Objective:                                                 ##
## This script plots sections of constant longitude for         ##
## temperature and salinity, and isopycnal surfaces.            ##
##                                                              ## 
## - History: Aug. 2018: original C.O. Dufour                   ##
##                                                              ## 
##################################################################


# import modules 
from netCDF4 import Dataset
from eos import *
from plottools import *
from utiltools import *
import matplotlib.pyplot as plt
from om4_models import *
import numpy as np
from PyRaf import *
import cmocean
 
##### to be set #####
# var name
yrdeb = 1988
yrend = 2007
# model
#modelist  = [OM4p25,OM4p5,OM4p5_noeddy]
modelist  = [OM4p5_noeddy]
# paths
path2grid     = '/work/Carolina.Dufour/Mosaic'
path2figs     = '/work/Carolina.Dufour/Figures/comp_model2model/OM4'
# domain
latmax        = -50
region        = 'Weddell'
#####################

## domain
if region=='Weddell': lon0 = -42 

## time period
yrs  = str(yrdeb).zfill(4)+'-'+str(yrend).zfill(4)
freq = yrend - yrdeb + 1

############### Main ###############
for k in range(len(modelist)):
  arch = modelist[k]
  print arch.__name__

  ### paths
  path2data = arch.path2ocean+'/av/annual_'+str(freq)+'yr'

  ### grid
  filegrid  = arch.path2ocean + '/ocean_annual_z.static.nc'
  fid = Dataset(filegrid)
  lati = fid.variables['yh'][:]
  jmax = find_j(lati,latmax)
  lat  = lati[:jmax+1]
  loni = fid.variables['xq'][:]
  i0   = find_j(loni,lon0) 
  lon  = loni[i0] 	
  area = fid.variables['areacello'][:jmax+1,i0]
  fid.close()
  ### load time period
  filein = path2data + '/ocean_annual_z.'+str(yrdeb)+'-'+str(yrend)+'.ann.nc'	
  fid = Dataset(filein)
  temp = fid.variables['thetao'][...,:jmax+1,i0].squeeze()
  salt = fid.variables['so'][...,:jmax+1,i0].squeeze()
  dep  = fid.variables['z_l'][:].squeeze()
  vol  = fid.variables['volcello'][...,:jmax+1,i0].squeeze()
  fid.close()
  # Compute density
  sig0 = sigma_n(temp,salt,0) 
  sig2 = sigma_n(temp,salt,2) 
  ### Load initial time period
  filein = path2data + '/ocean_annual_z.1708-1727.ann.nc'
  fid = Dataset(filein)
  temp0 = fid.variables['thetao'][...,:jmax+1,i0].squeeze()
  salt0 = fid.variables['so'][...,:jmax+1,i0].squeeze()
  fid.close()
  # Compute density
  sig00 = sigma_n(temp0,salt0,0)
  sig20 = sigma_n(temp0,salt0,2)
  ### Deal with partial cell
  dz = vol/area
  kmax = dz.shape[0]
  zl    = 0.0 * dz[:]
  zl[0] = 0.5 * dz[0]
  k=1
  while k < kmax:
    zl[k] = zl[k-1] + 0.5 * (dz[k]+dz[k-1])
    k = k+1    
  zl_nm = np.array(zl)

  ######## Plot
  ## temp
  lats,deps = np.meshgrid(lat,dep)
  #vmin =-1.5 ; vmax = 4 
  vmin =-2.5 ; vmax = 3 
  tab = limit_range(temp,vmin,vmax)
  fsize=12
  plt.figure(figsize=(12,6))
  plt.subplot(111,axisbg='gray')
  plt.contourf(lats,zl_nm,tab,30,cmap=plt.cm.magma,vmin=vmin,vmax=vmax)
  plt.colorbar(orientation='vertical')
  ## sigma_0 contours
  cl0  = plt.contour(lats,zl_nm,sig0,[27.6,27.7,27.8],colors='k')
  cl00 = plt.contour(lats,zl_nm,sig00,[27.6,27.7,27.8],colors='w')
  ## sigma_2 contours
  cl2  = plt.contour(lats,zl_nm,sig2,[37.18,37.2],colors='k')
  cl20 = plt.contour(lats,zl_nm,sig20,[37.18,37.2],colors='w')
  #
  plt.gca().invert_yaxis()
  #
  plt.clabel(cl0,inline=True,fmt='%.2f',manual=True)
  plt.clabel(cl00,inline=True,fmt='%.2f',manual=True)
  plt.clabel(cl2,inline=True,fmt='%.2f',manual=True)
  plt.clabel(cl20,inline=True,fmt='%.2f',manual=True)
  #
  plt.xlabel('Latitude',size=fsize)
  plt.ylabel('Depth (m)',size=fsize)
  plt.xticks(size=fsize) ; plt.yticks(size=fsize)
  plt.savefig(path2figs+'/'+arch.__name__+'_'+str(yrdeb).zfill(4)+'-'+str(yrend).zfill(4)+'_temp_sig0_section_'+region+'.png')
  plt.show()
  ## salt
  vmin =33.8 ; vmax = 34.8
  tab = limit_range(salt,vmin,vmax)
  fsize=12
  plt.figure(figsize=(12,6))
  plt.subplot(111,axisbg='gray')
  plt.contourf(lats,zl_nm,tab,30,cmap=cmocean.cm.haline,vmin=vmin,vmax=vmax)
  plt.colorbar(orientation='vertical')
  ## sigma_0 contours
  cl0  = plt.contour(lats,zl_nm,sig0,[27.6,27.7,27.8],colors='k')
  cl00 = plt.contour(lats,zl_nm,sig00,[27.6,27.7,27.8],colors='w')
  ## sigma_2 contours
  cl2  = plt.contour(lats,zl_nm,sig2,[37.18,37.2],colors='k')
  cl20 = plt.contour(lats,zl_nm,sig20,[37.18,37.2],colors='w')
  #
  plt.gca().invert_yaxis()
  #
  plt.clabel(cl0,inline=True,fmt='%.2f',manual=True)
  plt.clabel(cl00,inline=True,fmt='%.2f',manual=True)
  plt.clabel(cl2,inline=True,fmt='%.2f',manual=True)
  plt.clabel(cl20,inline=True,fmt='%.2f',manual=True)
  #
  plt.xlabel('Latitude',size=fsize)
  plt.ylabel('Depth (m)',size=fsize)
  plt.xticks(size=fsize) ; plt.yticks(size=fsize)
  plt.savefig(path2figs+'/'+arch.__name__+'_'+str(yrdeb).zfill(4)+'-'+str(yrend).zfill(4)+'_salt_sig0_section_'+region+'.png')
  plt.show()



