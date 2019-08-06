function OM4_paper_figs(Fig_dir)


close all

addpath('./utils/export_fig/')
addpath('./utils/')
addpath('./utils/m_map/')

month_str={'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'};

cycle=5;

%%%%%%LOAD MODEL DATA

%%p5
model='OM4p5';
run='OM4p5_IAF_BLING_CFC_abio_csf_mle200';

dataDir=['/work/mib/raw_data/',model,'/',run];

var=['siconc_nh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIC_nh=data;
w_nh=w;
x_nh_p5=x;
y_nh_p5=y;
ifXY_nh_p5=ifXY;

var=['siconc_sh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIC_sh=data;
w_sh=w;
x_sh_p5=x;
y_sh_p5=y;
ifXY_sh_p5=ifXY;

var=['sithick_nh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIT_nh=data;

var=['sithick_sh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIT_sh=data;

[SIC_clim_nh_p5 SIC_std_nh_p5 SIT_clim_nh_p5 SIT_std_nh_p5 extent_nh_p5 extent_clim_nh_p5 extent_anom_nh_p5 volume_nh_p5 volume_clim_nh_p5 volume_anom_nh_p5]=computeSeaIceDiagnostics(SIC_nh,SIT_nh,w_nh);
[SIC_clim_sh_p5 SIC_std_sh_p5 SIT_clim_sh_p5 SIT_std_sh_p5 extent_sh_p5 extent_clim_sh_p5 extent_anom_sh_p5 volume_sh_p5 volume_clim_sh_p5 volume_anom_sh_p5]=computeSeaIceDiagnostics(SIC_sh,SIT_sh,w_sh);

time_CORE2=1948+1/24:1/12:2008-1/24;
CORE2_years=1948:1:2007;
nT_CORE2=length(time_CORE2);

%define common period of 1979-2007 for computing climatology
ind1=(1979-1948)*12+1;
ind2=(2008-1948)*12;
[SIC_clim_common_nh_p5 SIC_std_common_nh_p5 SIT_clim_common_nh_p5 SIT_std_common_nh_p5 extent_common_nh_p5 extent_clim_common_nh_p5 extent_anom_common_nh_p5 volume_common_nh_p5 volume_clim_common_nh_p5 volume_anom_common_nh_p5]=computeSeaIceDiagnostics(SIC_nh(:,ind1:ind2),SIT_nh(:,ind1:ind2),w_nh);
[SIC_clim_common_sh_p5 SIC_std_common_sh_p5 SIT_clim_common_sh_p5 SIT_std_common_sh_p5 extent_common_sh_p5 extent_clim_common_sh_p5 extent_anom_common_sh_p5 volume_common_sh_p5 volume_clim_common_sh_p5 volume_anom_common_sh_p5]=computeSeaIceDiagnostics(SIC_sh(:,ind1:ind2),SIT_sh(:,ind1:ind2),w_sh);

%%p5_no_eddy
model='OM4p5';
run='OM4p5_IAF_BLING_CFC_abio_csf_p25config';

dataDir=['/work/mib/raw_data/',model,'/',run];

var=['siconc_nh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIC_nh=data;
w_nh=w;
x_nh=x;
y_nh=y;
ifXY_nh=ifXY;

var=['siconc_sh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIC_sh=data;
w_sh=w;
x_sh=x;
y_sh=y;
ifXY_sh=ifXY;

var=['sithick_nh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIT_nh=data;

var=['sithick_sh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIT_sh=data;

[SIC_clim_nh_p5_no_eddy SIC_std_nh_p5_no_eddy SIT_clim_nh_p5_no_eddy SIT_std_nh_p5_no_eddy extent_nh_p5_no_eddy extent_clim_nh_p5_no_eddy extent_anom_nh_p5_no_eddy volume_nh_p5_no_eddy volume_clim_nh_p5_no_eddy volume_anom_nh_p5_no_eddy]=computeSeaIceDiagnostics(SIC_nh,SIT_nh,w_nh);
[SIC_clim_sh_p5_no_eddy SIC_std_sh_p5_no_eddy SIT_clim_sh_p5_no_eddy SIT_std_sh_p5_no_eddy extent_sh_p5_no_eddy extent_clim_sh_p5_no_eddy extent_anom_sh_p5_no_eddy volume_sh_p5_no_eddy volume_clim_sh_p5_no_eddy volume_anom_sh_p5_no_eddy]=computeSeaIceDiagnostics(SIC_sh,SIT_sh,w_sh);

time_CORE2=1948+1/24:1/12:2008-1/24;
CORE2_years=1948:1:2007;
nT_CORE2=length(time_CORE2);

%define common period of 1979-2007 for computing climatology
ind1=(1979-1948)*12+1;
ind2=(2008-1948)*12;
[SIC_clim_common_nh_p5_no_eddy SIC_std_common_nh_p5_no_eddy SIT_clim_common_nh_p5_no_eddy SIT_std_common_nh_p5_no_eddy extent_common_nh_p5_no_eddy extent_clim_common_nh_p5_no_eddy extent_anom_common_nh_p5_no_eddy volume_common_nh_p5_no_eddy volume_clim_common_nh_p5_no_eddy volume_anom_common_nh_p5_no_eddy]=computeSeaIceDiagnostics(SIC_nh(:,ind1:ind2),SIT_nh(:,ind1:ind2),w_nh);
[SIC_clim_common_sh_p5_no_eddy SIC_std_common_sh_p5_no_eddy SIT_clim_common_sh_p5_no_eddy SIT_std_common_sh_p5_no_eddy extent_common_sh_p5_no_eddy extent_clim_common_sh_p5_no_eddy extent_anom_common_sh_p5_no_eddy volume_common_sh_p5_no_eddy volume_clim_common_sh_p5_no_eddy volume_anom_common_sh_p5_no_eddy]=computeSeaIceDiagnostics(SIC_sh(:,ind1:ind2),SIT_sh(:,ind1:ind2),w_sh);

%p25
model='OM4p25';
run='OM4p25_IAF_BLING_CFC_csf';

dataDir=['/work/mib/raw_data/',model,'/',run];

var=['siconc_nh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIC_nh=data;
w_nh=w;
x_nh_p25=x;
y_nh_p25=y;
ifXY_nh_p25=ifXY;

var=['siconc_sh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIC_sh=data;
w_sh=w;
x_sh_p25=x;
y_sh_p25=y;
ifXY_sh_p25=ifXY;

var=['sithick_nh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIT_nh=data;

var=['sithick_sh'];
filename=[dataDir,'/',var,'.mat']
load(filename,'data','time','x','y','ifXY','w','area_weights')
SIT_sh=data;

[SIC_clim_nh_p25 SIC_std_nh_p25 SIT_clim_nh_p25 SIT_std_nh_p25 extent_nh_p25 extent_clim_nh_p25 extent_anom_nh_p25 volume_nh_p25 volume_clim_nh_p25 volume_anom_nh_p25]=computeSeaIceDiagnostics(SIC_nh,SIT_nh,w_nh);
[SIC_clim_sh_p25 SIC_std_sh_p25 SIT_clim_sh_p25 SIT_std_sh_p25 extent_sh_p25 extent_clim_sh_p25 extent_anom_sh_p25 volume_sh_p25 volume_clim_sh_p25 volume_anom_sh_p25]=computeSeaIceDiagnostics(SIC_sh,SIT_sh,w_sh);

time_CORE2=1948+1/24:1/12:2008-1/24;
CORE2_years=1948:1:2007;
nT_CORE2=length(time_CORE2);

%define common period of 1979-2007 for computing climatology
ind1=(1979-1948)*12+1;
ind2=(2008-1948)*12;
[SIC_clim_common_nh_p25 SIC_std_common_nh_p25 SIT_clim_common_nh_p25 SIT_std_common_nh_p25 extent_common_nh_p25 extent_clim_common_nh_p25 extent_anom_common_nh_p25 volume_common_nh_p25 volume_clim_common_nh_p25 volume_anom_common_nh_p25]=computeSeaIceDiagnostics(SIC_nh(:,ind1:ind2),SIT_nh(:,ind1:ind2),w_nh);
[SIC_clim_common_sh_p25 SIC_std_common_sh_p25 SIT_clim_common_sh_p25 SIT_std_common_sh_p25 extent_common_sh_p25 extent_clim_common_sh_p25 extent_anom_common_sh_p25 volume_common_sh_p25 volume_clim_common_sh_p25 volume_anom_common_sh_p25]=computeSeaIceDiagnostics(SIC_sh(:,ind1:ind2),SIT_sh(:,ind1:ind2),w_sh);

%%%%%%%LOAD OBS DATA

%p25 grid

%%load obs data
time_obs=1979+1/24:1/12:2017-1/24;
obs_years=1979:2016;

obsdir=['/work/mib/raw_data/NSIDC/NASATEAM_merged_v1.1_nrt'];
load([obsdir,'/sic_nh_regrid_GFDL_CM4.mat'],'data','x','y','ifXY','w','area_weights')
%load([obsdir,'/sic.mat'],'data','x','y','ifXY','w')
SIC_obs_nh=data/100;
w_obs_nh=w;
%x_NSIDC=x;
%y_NSIDC=y;
%ifXY_NSIDC=ifXY;

SIT_obs_nh=zeros(size(SIC_obs_nh));

obsdir=['/work/mib/raw_data/NSIDC/NASATEAM_merged_v1.1_nrt_sh'];
load([obsdir,'/sic_sh_regrid_GFDL_CM4.mat'],'data','x','y','ifXY','w','area_weights')
%load([obsdir,'/sic.mat'],'data','x','y','ifXY','w','area_weights')
SIC_obs_sh=data/100;
w_obs_sh=w;

SIT_obs_sh=zeros(size(SIC_obs_sh));

[SIC_clim_obs_nh SIC_std_obs_nh SIT_clim_obs_nh SIT_std_obs_nh extent_obs_nh extent_clim_obs_nh extent_anom_obs_nh volume_obs_nh volume_clim_obs_nh volume_anom_obs_nh]=computeSeaIceDiagnostics(SIC_obs_nh,SIT_obs_nh,w_obs_nh);
[SIC_clim_obs_sh SIC_std_obs_sh SIT_clim_obs_sh SIT_std_obs_sh extent_obs_sh extent_clim_obs_sh extent_anom_obs_sh volume_obs_sh volume_clim_obs_sh volume_anom_obs_sh]=computeSeaIceDiagnostics(SIC_obs_sh,SIT_obs_sh,w_obs_sh);

%define common period of 1979-2007 for computing climatology
ind1=(1979-1979)*12+1;
ind2=(2008-1979)*12;

[SIC_clim_obs_common_nh SIC_std_obs_common_nh SIT_clim_obs_common_nh SIT_std_obs_common_nh extent_obs_common_nh extent_clim_obs_common_nh extent_anom_obs_common_nh volume_obs_common_nh volume_clim_obs_common_nh volume_anom_obs_common_nh]=computeSeaIceDiagnostics(SIC_obs_nh(:,ind1:ind2),SIT_obs_nh(:,ind1:ind2),w_obs_nh);
[SIC_clim_obs_common_sh SIC_std_obs_common_sh SIT_clim_obs_common_sh SIT_std_obs_common_sh extent_obs_common_sh extent_clim_obs_common_sh extent_anom_obs_common_sh volume_obs_common_sh volume_clim_obs_common_sh volume_anom_obs_common_sh]=computeSeaIceDiagnostics(SIC_obs_sh(:,ind1:ind2),SIT_obs_sh(:,ind1:ind2),w_obs_sh);

%%nsidc grid

obsdir=['/work/mib/raw_data/NSIDC/NASATEAM_merged_v1.1_nrt'];
load([obsdir,'/sic.mat'],'data','x','y','ifXY','w')
%load([obsdir,'/sic.mat'],'data','x','y','ifXY','w')
SIC_NSIDCgrid_nh=data/100;
w_NSIDC_nh=w;
x_NSIDC=x;
y_NSIDC=y;
ifXY_NSIDC=ifXY;

clearvars w

SIT_NSIDCgrid_nh=zeros(size(SIC_NSIDCgrid_nh));

[SIC_clim_NSIDCgrid_nh SIC_std_NSIDCgrid_nh SIT_clim_NSIDCgrid_nh SIT_std_NSIDCgrid_nh extent_NSIDCgrid_nh extent_clim_NSIDCgrid_nh extent_anom_NSIDCgrid_nh volume_NSIDCgrid_nh volume_clim_NSIDCgrid_nh volume_anom_NSIDCgrid_nh]=computeSeaIceDiagnostics(SIC_NSIDCgrid_nh(:,:),SIT_NSIDCgrid_nh(:,:),w_NSIDC_nh);

%define common period of 1979-2007 for computing climatology
ind1=(1979-1979)*12+1;
ind2=(2008-1979)*12;

[SIC_clim_NSIDCgrid_common_nh SIC_std_NSIDCgrid_common_nh SIT_clim_NSIDCgrid_common_nh SIT_std_NSIDCgrid_common_nh extent_NSIDCgrid_common_nh extent_clim_NSIDCgrid_common_nh extent_anom_NSIDCgrid_common_nh volume_NSIDCgrid_common_nh volume_clim_NSIDCgrid_common_nh volume_anom_NSIDCgrid_common_nh]=computeSeaIceDiagnostics(SIC_NSIDCgrid_nh(:,ind1:ind2),SIT_NSIDCgrid_nh(:,ind1:ind2),w_NSIDC_nh);

obsdir=['/work/mib/raw_data/NSIDC/NASATEAM_merged_v1.1_nrt_sh'];
load([obsdir,'/sic.mat'],'data','x','y','ifXY','w')
%load([obsdir,'/sic.mat'],'data','x','y','ifXY','w')
SIC_NSIDCgrid_sh=data/100;
w_NSIDC_sh=w;
x_NSIDC=x;
y_NSIDC=y;
ifXY_NSIDC_sh=ifXY;

SIT_NSIDCgrid_sh=zeros(size(SIC_NSIDCgrid_sh));

[SIC_clim_NSIDCgrid_sh SIC_std_NSIDCgrid_sh SIT_clim_NSIDCgrid_sh SIT_std_NSIDCgrid_sh extent_NSIDCgrid_sh extent_clim_NSIDCgrid_sh extent_anom_NSIDCgrid_sh volume_NSIDCgrid_sh volume_clim_NSIDCgrid_sh volume_anom_NSIDCgrid_sh]=computeSeaIceDiagnostics(SIC_NSIDCgrid_sh(:,:),SIT_NSIDCgrid_sh(:,:),w_NSIDC_sh);

%define common period of 1979-2007 for computing climatology
ind1=(1979-1979)*12+1;
ind2=(2008-1979)*12;

[SIC_clim_NSIDCgrid_common_sh SIC_std_NSIDCgrid_common_sh SIT_clim_NSIDCgrid_common_sh SIT_std_NSIDCgrid_common_sh extent_NSIDCgrid_common_sh extent_clim_NSIDCgrid_common_sh extent_anom_NSIDCgrid_common_sh volume_NSIDCgrid_common_sh volume_clim_NSIDCgrid_common_sh volume_anom_NSIDCgrid_common_sh]=computeSeaIceDiagnostics(SIC_NSIDCgrid_sh(:,ind1:ind2),SIT_NSIDCgrid_sh(:,ind1:ind2),w_NSIDC_sh);


%p5 grid

%%load obs data
time_obs=1979+1/24:1/12:2017-1/24;
obs_years=1979:2016;

obsdir=['/work/mib/raw_data/NSIDC/NASATEAM_merged_v1.1_nrt'];
load([obsdir,'/sic_nh_regrid_GFDL_OM4p5.mat'],'data','x','y','ifXY','w','area_weights')
%load([obsdir,'/sic.mat'],'data','x','y','ifXY','w')
SIC_obs_nh=data/100;
w_obs_nh=w;
x_NSIDC=x;
y_NSIDC=y;
ifXY_NSIDC=ifXY;

SIT_obs_nh=zeros(size(SIC_obs_nh));

%obsdir=['/work/mib/raw_data/NSIDC/NASATEAM_merged_v1.1_nrt_sh'];
%load([obsdir,'/sic_sh_regrid_GFDL_CM4.mat'],'data','x','y','ifXY','w','area_weights')
%%load([obsdir,'/sic.mat'],'data','x','y','ifXY','w','area_weights')
%SIC_obs_sh=data/100;
%w_obs_sh=w;
%
%SIT_obs_sh=zeros(size(SIC_obs_sh));

[SIC_clim_obs_nh_p5 SIC_std_obs_nh_p5 SIT_clim_obs_nh_p5 SIT_std_obs_nh_p5 extent_obs_nh_p5 extent_clim_obs_nh_p5 extent_anom_obs_nh_p5 volume_obs_nh_p5 volume_clim_obs_nh_p5 volume_anom_obs_nh_p5]=computeSeaIceDiagnostics(SIC_obs_nh,SIT_obs_nh,w_obs_nh);
%[SIC_clim_obs_sh SIC_std_obs_sh SIT_clim_obs_sh SIT_std_obs_sh extent_obs_sh extent_clim_obs_sh extent_anom_obs_sh volume_obs_sh volume_clim_obs_sh volume_anom_obs_sh]=computeSeaIceDiagnostics(SIC_obs_sh,SIT_obs_sh,w_obs_sh);

%define common period of 1979-2007 for computing climatology
ind1=(1979-1979)*12+1;
ind2=(2008-1979)*12;

[SIC_clim_obs_common_nh_p5 SIC_std_obs_common_nh_p5 SIT_clim_obs_common_nh_p5 SIT_std_obs_common_nh_p5 extent_obs_common_nh_p5 extent_clim_obs_common_nh_p5 extent_anom_obs_common_nh_p5 volume_obs_common_nh_p5 volume_clim_obs_common_nh_p5 volume_anom_obs_common_nh_p5]=computeSeaIceDiagnostics(SIC_obs_nh(:,ind1:ind2),SIT_obs_nh(:,ind1:ind2),w_obs_nh);
%[SIC_clim_obs_common_sh SIC_std_obs_common_sh SIT_clim_obs_common_sh SIT_std_obs_common_sh extent_obs_common_sh extent_clim_obs_common_sh extent_anom_obs_common_sh volume_obs_common_sh volume_clim_obs_common_sh volume_anom_obs_common_sh]=computeSeaIceDiagnostics(SIC_obs_sh(:,ind1:ind2),SIT_obs_sh(:,ind1:ind2),w_obs_sh);

%load sh clim/sig
obsdir=['/work/mib/raw_data/NSIDC/NASATEAM_merged_v1.1_nrt_sh'];
load([obsdir,'/sic_sh_regrid_GFDL_OM4p5_clim_std.mat'],'data_clim','data_std','x','y','ifXY','w','area_weights')

SIC_clim_obs_common_sh_p5=data_clim/100; 
SIC_std_obs_common_sh_p5=data_std/100;


for month=1:12
disp(['NH month ',num2str(month)])
%tmp1=extent_common_nh_p25(month:12:end);
%tmp1=extent_common_nh_p5(month:12:end);
tmp1=extent_common_nh_p5_no_eddy(month:12:end);
tmp2=extent_obs_common_nh(month:12:end);
r=corrcoef(tmp1,tmp2);
r(1,2)
r=corrcoef(detrend(tmp1),detrend(tmp2));
r(1,2)
disp(['SH month ',num2str(month)])
%tmp1=extent_common_sh_p25(month:12:end);
%tmp1=extent_common_sh_p5(month:12:end);
tmp1=extent_common_sh_p5_no_eddy(month:12:end);
tmp2=extent_obs_common_sh(month:12:end);
r=corrcoef(tmp1,tmp2);
r(1,2)
r=corrcoef(detrend(tmp1),detrend(tmp2));
r(1,2)
end

%%%%%%%%MAKE FIGURES

%%%FIGURE 1: NH/SH SIE

    nTileX=2;
    nTileY = 1;
        
    figWidth = 9.5; %6.5 inches = 39 picas, for a two column figure
    deltaX   = 0.6;
    deltaX2  = 0.2;
    deltaY   = 0.5;
    deltaY2  = 0.3;
    gapX     = 0.4;
    gapY     = 0.6;
    panel_scale=0.8;

ax=make_axes(nTileX,nTileY,figWidth,deltaX,deltaX2,deltaY,deltaY2,gapX,gapY,panel_scale);

axes(ax(1,1))

fact=1e-12;
L=1;

hold on
%plot(1:12,fact*extent_clim_obs_common_nh,'k','LineWidth',2)
plot(1:12,fact*extent_clim_NSIDCgrid_common_nh,'k','LineWidth',2)
plot(1:12,fact*extent_clim_common_nh_p25,'r','LineWidth',L)
plot(1:12,fact*extent_clim_common_nh_p5,'b','LineWidth',L)
plot(1:12,fact*extent_clim_common_nh_p5_no_eddy,'b','LineWidth',L,'LineStyle','--')
xlabel('Month')
ylabel('SIE (Million km^2)')
xlim([0.5 12.5])
grid on
title('Arctic SIE Climatology (1979-2007)')
set(gca,'xTick',1:12,'xTickLabel',{'J','F','M','A','M','J','J','A','S','O','N','D'} )
legend('NSIDC','OM4p25','OM4p5','OM4p5n','location','SouthWest')
text(-0.5,16.6,'A','FontWeight','bold')


axes(ax(2,1))

hold on
%plot(1:12,fact*extent_clim_obs_common_sh,'k','LineWidth',2)
plot(1:12,fact*extent_clim_NSIDCgrid_common_sh,'k','LineWidth',2)
plot(1:12,fact*extent_clim_common_sh_p25,'r','LineWidth',L)
plot(1:12,fact*extent_clim_common_sh_p5,'b','LineWidth',L)
plot(1:12,fact*extent_clim_common_sh_p5_no_eddy,'b','LineWidth',L,'LineStyle','--')
xlabel('Month')
xlim([0.5 12.5])
grid on
%ylabel('SIE')
title('Antarctic SIE Climatology (1979-2007)')
set(gca,'xTick',1:12,'xTickLabel',{'J','F','M','A','M','J','J','A','S','O','N','D'} )
legend('NSIDC','OM4p25','OM4p5','OM4p5n','location','SouthEast')
text(-0.2,26.5,'B','FontWeight','bold')

set(gcf,'Color','w')
filename=[Fig_dir,'/SIE_clim.pdf'];
export_fig(gcf,filename,'-a1','-pdf');

%%%FIGURE 2: NH/SH SIE timeseries

    nTileX=2;
    nTileY = 2;
        
    figWidth = 9.5; %6.5 inches = 39 picas, for a two column figure
    deltaX   = 0.7;
    deltaX2  = 0.2;
    deltaY   = 0.5;
    deltaY2  = 0.3;
    gapX     = 0.4;
    gapY     = 0.8;
    panel_scale=0.8;

ax=make_axes(nTileX,nTileY,figWidth,deltaX,deltaX2,deltaY,deltaY2,gapX,gapY,panel_scale);


fact=1e-12;
L=1;

size(extent_NSIDCgrid_nh)
size(extent_NSIDCgrid_sh)
size(obs_years)

axes(ax(1,1))
month=3;
hold on
%plot(obs_years,fact*extent_obs_nh(month:12:end),'k','LineWidth',2)
plot(obs_years,fact*extent_NSIDCgrid_nh(month:12:end),'k','LineWidth',2)
plot(CORE2_years,fact*extent_nh_p25(month:12:end),'r','LineWidth',L)
plot(CORE2_years,fact*extent_nh_p5(month:12:end),'b','LineWidth',L)
plot(CORE2_years,fact*extent_nh_p5_no_eddy(month:12:end),'b','LineWidth',L,'LineStyle','--')
grid on
legend('NSIDC','OM4p25','OM4p5','OM4p5n','location','SouthWest')
xlim([1947 2008])
ylim([14 16.6])
xlabel('Time (years)')
ylabel('SIE (Million km^2)')
title('March Arctic SIE')
text(1943,16.7,'A','FontWeight','bold')

disp('Arctic March p25')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_nh(month:12:end),extent_nh_p25(month:12:end),1979,1948,[1979 2007])
disp('Arctic March p5')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_nh(month:12:end),extent_nh_p5(month:12:end),1979,1948,[1979 2007])
disp('Arctic March p5 no eddy')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_nh(month:12:end),extent_nh_p5_no_eddy(month:12:end),1979,1948,[1979 2007])

axes(ax(2,1))
month=9;
hold on
%plot(obs_years,fact*extent_obs_nh(month:12:end),'k','LineWidth',2)
plot(obs_years,fact*extent_NSIDCgrid_nh(month:12:end),'k','LineWidth',2)
plot(CORE2_years,fact*extent_nh_p25(month:12:end),'r','LineWidth',L)
plot(CORE2_years,fact*extent_nh_p5(month:12:end),'b','LineWidth',L)
plot(CORE2_years,fact*extent_nh_p5_no_eddy(month:12:end),'b','LineWidth',L,'LineStyle','--')
grid on
%legend('p5','p5 no eddy','p25','NSIDC','location','SouthWest')
%xlim([1978 2016])
xlim([1947 2008])
xlabel('Time (years)')
%ylabel('SIE')
title('September Arctic SIE')
text(1943,9.3,'B','FontWeight','bold')

disp('Arctic Sept p25')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_nh(month:12:end),extent_nh_p25(month:12:end),1979,1948,[1979 2007])
disp('Arctic Sept p5')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_nh(month:12:end),extent_nh_p5(month:12:end),1979,1948,[1979 2007])
disp('Arctic Sept p5 no eddy')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_nh(month:12:end),extent_nh_p5_no_eddy(month:12:end),1979,1948,[1979 2007])

axes(ax(1,2))
month=3;
hold on
%plot(obs_years,fact*extent_obs_sh(month:12:end),'k','LineWidth',2)
plot(obs_years,fact*extent_NSIDCgrid_sh(month:12:end),'k','LineWidth',2)
plot(CORE2_years,fact*extent_sh_p25(month:12:end),'r','LineWidth',L)
plot(CORE2_years,fact*extent_sh_p5(month:12:end),'b','LineWidth',L)
plot(CORE2_years,fact*extent_sh_p5_no_eddy(month:12:end),'b','LineWidth',L,'LineStyle','--')
grid on
%legend('NSIDC','p25','p5','p5 no eddy','location','SouthWest')
%xlim([1978 2016])
xlim([1947 2008])
xlabel('Time (years)')
ylabel('SIE (Million km^2)')
title('March Antarctic SIE')
text(1943,6.4,'C','FontWeight','bold')

disp('Antarctic March p25')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_sh(month:12:end),extent_sh_p25(month:12:end),1979,1948,[1979 2007])
disp('Antarctic March p5')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_sh(month:12:end),extent_sh_p5(month:12:end),1979,1948,[1979 2007])
disp('Antarctic March p5 no eddy')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_sh(month:12:end),extent_sh_p5_no_eddy(month:12:end),1979,1948,[1979 2007])

axes(ax(2,2))
month=9;
hold on
%plot(obs_years,fact*extent_obs_sh(month:12:end),'k','LineWidth',2)
plot(obs_years,fact*extent_NSIDCgrid_sh(month:12:end),'k','LineWidth',2)
plot(CORE2_years,fact*extent_sh_p25(month:12:end),'r','LineWidth',L)
plot(CORE2_years,fact*extent_sh_p5(month:12:end),'b','LineWidth',L)
plot(CORE2_years,fact*extent_sh_p5_no_eddy(month:12:end),'b','LineWidth',L,'LineStyle','--')
grid on
%legend('p5','p5 no eddy','p25','NSIDC','location','SouthWest')
%xlim([1978 2016])
xlim([1947 2008])
xlabel('Time (years)')
%ylabel('SIE')
title('September Antarctic SIE')
text(1943,25,'D','FontWeight','bold')

disp('Antarctic Sept p25')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_sh(month:12:end),extent_sh_p25(month:12:end),1979,1948,[1979 2007])
disp('Antarctic Sept p5')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_sh(month:12:end),extent_sh_p5(month:12:end),1979,1948,[1979 2007])
disp('Antarctic Sept p5 no eddy')
[obs_mean obs_sig obs_sig_detrend obs_trend model_mean model_sig model_sig_detrend model_trend r_full r_detrend]=computeSeaIceStats(extent_NSIDCgrid_sh(month:12:end),extent_sh_p5_no_eddy(month:12:end),1979,1948,[1979 2007])

set(gcf,'Color','w')
filename=[Fig_dir,'/SIE_interannnual.pdf'];
export_fig(gcf,filename,'-a1','-pdf');

%%%FIGURE 3: SIC biases

load('./utils/cmap_jet4.mat')

    nTileX=3;
    nTileY = 4;
        
    figWidth = 6.5; %6.5 inches = 39 picas, for a two column figure
    deltaX   = 0.4;
    deltaX2  = 0.02;
    deltaY   = 0.5;
    deltaY2  = 0.3;
    gapX     = 0.02;
    gapY     = 0.1;
    panel_scale=1;

ax=make_axes(nTileX,nTileY,figWidth,deltaX,deltaX2,deltaY,deltaY2,gapX,gapY,panel_scale);

axes(ax(1,1))
tmp_obs_p25=SIC_clim_obs_common_nh(:,3);
tmp_obs_p5=SIC_clim_obs_common_nh_p5(:,3);

tmp=SIC_clim_common_nh_p25(:,3);
make_polar_plot_pcolor(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp-tmp_obs_p25,45,'',0,-1,1);
make_polar_contour_plot(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp_obs_p25,45,'','k',1)
text(-0.75,0.9,'A','FontWeight','bold')
text(-1,-0.3,'March SIC Bias','FontWeight','bold','rotation',90)
text(-0.4,0.94,'OM4p25','FontWeight','bold','FontSize',16)

axes(ax(2,1))
tmp=SIC_clim_common_nh_p5(:,3);
hold on
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp-tmp_obs_p5,45,'',0,-1,1);
make_polar_contour_plot(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp_obs_p25,45,'','k',1)
%make_polar_contour_plot(x_nh_p5,y_nh_p5,ifXY_nh,tmp_obs_p5,45,'','k',1)
text(-0.75,0.9,'B','FontWeight','bold')
text(-0.35,0.94,'OM4p5','FontWeight','bold','FontSize',16)

axes(ax(3,1))

tmp=SIC_clim_common_nh_p5_no_eddy(:,3);
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp-tmp_obs_p5,45,'',0,-1,1);
make_polar_contour_plot(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp_obs_p25,45,'','k',1)
text(-0.75,0.9,'C','FontWeight','bold')
text(-0.4,0.94,'OM4p5n','FontWeight','bold','FontSize',16)

                 
%                 pos=get(gca,'position');
%
%                 c=colorbar('horizontal');
%
%                 set(gca,'position',pos)
%
%                 x_pos=get(c, 'Position');
%                 y_pos=[x_pos(1)+0.02 x_pos(2)-0.07 2*x_pos(3) 0.7*x_pos(4)];
%                 set(c,'Position',y_pos)

axes(ax(1,2))
tmp_obs_p25=SIC_clim_obs_common_nh(:,9);
tmp_obs_p5=SIC_clim_obs_common_nh_p5(:,9);

tmp=SIC_clim_common_nh_p25(:,9);
make_polar_plot_pcolor(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp-tmp_obs_p25,30,'',0,-1,1);
make_polar_contour_plot(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp_obs_p25,30,'','k',1)
text(-0.47,0.58,'D','FontWeight','bold')
text(-0.65,-0.3,'Sept SIC Bias','FontWeight','bold','rotation',90)

axes(ax(2,2))


tmp=SIC_clim_common_nh_p5(:,9);
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp-tmp_obs_p5,30,'',0,-1,1);
make_polar_contour_plot(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp_obs_p25,30,'','k',1)
text(-0.47,0.58,'E','FontWeight','bold')

axes(ax(3,2))

tmp=SIC_clim_common_nh_p5_no_eddy(:,9);
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp-tmp_obs_p5,30,'',0,-1,1);
make_polar_contour_plot(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp_obs_p25,30,'','k',1)
text(-0.47,0.58,'F','FontWeight','bold')

%SH SIC
axes(ax(1,3))
tmp_obs_p25=SIC_clim_obs_common_sh(:,9);
tmp_obs_p5=SIC_clim_obs_common_sh_p5(:,9);

tmp=SIC_clim_common_sh_p25(:,9);
make_polar_plot_pcolor_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp-tmp_obs_p25,40,'',0,-1,1);
make_polar_contour_plot_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp_obs_p25,40,'','k',1)
text(-0.7,0.8,'G','FontWeight','bold')
text(-0.86,-0.3,'Sept SIC Bias','FontWeight','bold','rotation',90)

axes(ax(2,3))

tmp=SIC_clim_common_sh_p5(:,9);
make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp-tmp_obs_p5,40,'',0,-1,1);
make_polar_contour_plot_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp_obs_p25,40,'','k',1)
text(-0.7,0.8,'H','FontWeight','bold')

axes(ax(3,3))

tmp=SIC_clim_common_sh_p5_no_eddy(:,9);
make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp-tmp_obs_p5,40,'',0,-1,1);
make_polar_contour_plot_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp_obs_p25,40,'','k',1)
text(-0.7,0.8,'I','FontWeight','bold')

axes(ax(1,4))
tmp_obs_p25=SIC_clim_obs_common_sh(:,3);
tmp_obs_p5=SIC_clim_obs_common_sh_p5(:,3);

tmp=SIC_clim_common_sh_p25(:,3);

make_polar_plot_pcolor_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp-tmp_obs_p25,30,'',0,-1,1);
make_polar_contour_plot_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp_obs_p25,30,'','k',1)
text(-0.47,0.58,'J','FontWeight','bold')
text(-0.65,-0.3,'March SIC Bias','FontWeight','bold','rotation',90)

                 pos=get(gca,'position');

                 c=colorbar('horizontal');

                 set(gca,'position',pos)

                 x_pos=get(c, 'Position');
                 y_pos=[x_pos(1)+0.02 x_pos(2)-0.06 4*x_pos(3) 0.7*x_pos(4)];
                 set(c,'Position',y_pos)


axes(ax(2,4))

tmp=SIC_clim_common_sh_p5(:,3);

make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp-tmp_obs_p5,30,'',0,-1,1);
make_polar_contour_plot_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp_obs_p25,30,'','k',1)
text(-0.47,0.58,'K','FontWeight','bold')

axes(ax(3,4))

tmp=SIC_clim_common_sh_p5_no_eddy(:,3);

make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp-tmp_obs_p5,30,'',0,-1,1);
make_polar_contour_plot_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp_obs_p25,30,'','k',1)
text(-0.47,0.58,'L','FontWeight','bold')
colormap(cmap)

set(gcf,'Color','w')
filename=[Fig_dir,'/SIC_bias'];
export_fig(gcf,filename,'-a1','-png','-r600','-painters');

%%%FIGURE 4: SIT clim

    nTileX=3;
    nTileY = 4;
        
    figWidth = 6.5; %6.5 inches = 39 picas, for a two column figure
    deltaX   = 0.4;
    deltaX2  = 0.02;
    deltaY   = 0.5;
    deltaY2  = 0.3;
    gapX     = 0.02;
    gapY     = 0.1;
    panel_scale=1;

ax=make_axes(nTileX,nTileY,figWidth,deltaX,deltaX2,deltaY,deltaY2,gapX,gapY,panel_scale);

load('./utils/cmap_red_seq.mat')

axes(ax(1,1))

SITmax=2.5;

tmp=SIT_clim_common_nh_p25(:,3);
make_polar_plot_pcolor(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp,45,'',0,0,SITmax);
text(-0.75,0.9,'A','FontWeight','bold')
text(-1,-0.3,'March SIT','FontWeight','bold','rotation',90)
text(-0.4,0.94,'OM4p25','FontWeight','bold','FontSize',16)
colormap(cmap)

axes(ax(2,1))
tmp=SIT_clim_common_nh_p5(:,3);
hold on
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp,45,'',0,0,SITmax);
%make_polar_contour_plot(x_nh_p5,y_nh_p5,ifXY_nh,tmp_obs_p5,45,'','k',1)
text(-0.75,0.9,'B','FontWeight','bold')
text(-0.35,0.94,'OM4p5','FontWeight','bold','FontSize',16)
colormap(cmap)

axes(ax(3,1))

tmp=SIT_clim_common_nh_p5_no_eddy(:,3);
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp,45,'',0,0,SITmax);
text(-0.75,0.9,'C','FontWeight','bold')
text(-0.4,0.94,'OM4p5n','FontWeight','bold','FontSize',16)
colormap(cmap)

                 
%                 pos=get(gca,'position');
%
%                 c=colorbar('horizontal');
%
%                 set(gca,'position',pos)
%
%                 x_pos=get(c, 'Position');
%                 y_pos=[x_pos(1)+0.02 x_pos(2)-0.07 2*x_pos(3) 0.7*x_pos(4)];
%                 set(c,'Position',y_pos)

axes(ax(1,2))

tmp=SIT_clim_common_nh_p25(:,9);
make_polar_plot_pcolor(x_nh_p25,y_nh_p25,ifXY_nh_p25,tmp,30,'',0,0,3);
text(-0.47,0.58,'D','FontWeight','bold')
text(-0.65,-0.3,'Sept SIT','FontWeight','bold','rotation',90)
colormap(cmap)

axes(ax(2,2))


tmp=SIT_clim_common_nh_p5(:,9);
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp,30,'',0,0,3);
text(-0.47,0.58,'E','FontWeight','bold')
colormap(cmap)

axes(ax(3,2))

tmp=SIT_clim_common_nh_p5_no_eddy(:,9);
make_polar_plot_pcolor(x_nh_p5,y_nh_p5,ifXY_nh_p5,tmp,30,'',0,0,3);
text(-0.47,0.58,'F','FontWeight','bold')
colormap(cmap)

%SH SIC
axes(ax(1,3))

tmp=SIT_clim_common_sh_p25(:,9);
make_polar_plot_pcolor_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp,40,'',0,0,3);
text(-0.7,0.8,'G','FontWeight','bold')
text(-0.86,-0.3,'Sept SIT','FontWeight','bold','rotation',90)
colormap(cmap)

axes(ax(2,3))

tmp=SIT_clim_common_sh_p5(:,9);
make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp,40,'',0,0,3);
text(-0.7,0.8,'H','FontWeight','bold')
colormap(cmap)

axes(ax(3,3))

tmp=SIT_clim_common_sh_p5_no_eddy(:,9);
make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp,40,'',0,0,3);
text(-0.7,0.8,'I','FontWeight','bold')
colormap(cmap)

axes(ax(1,4))

tmp=SIT_clim_common_sh_p25(:,3);

make_polar_plot_pcolor_sh(x_sh_p25,y_sh_p25,ifXY_sh_p25,tmp,30,'',0,0,3);
text(-0.47,0.58,'J','FontWeight','bold')
text(-0.65,-0.3,'March SIC Bias','FontWeight','bold','rotation',90)
colormap(cmap)

                 pos=get(gca,'position');

                 c=colorbar('horizontal');

                 set(gca,'position',pos)

                 x_pos=get(c, 'Position');
                 y_pos=[x_pos(1)+0.02 x_pos(2)-0.06 4*x_pos(3) 0.7*x_pos(4)];
                 set(c,'Position',y_pos)


axes(ax(2,4))

tmp=SIT_clim_common_sh_p5(:,3);

make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp,30,'',0,0,3);
text(-0.47,0.58,'K','FontWeight','bold')
colormap(cmap)

axes(ax(3,4))

tmp=SIT_clim_common_sh_p5_no_eddy(:,3);

make_polar_plot_pcolor_sh(x_sh_p5,y_sh_p5,ifXY_sh_p5,tmp,30,'',0,0,3);
text(-0.47,0.58,'L','FontWeight','bold')
colormap(cmap)

set(gcf,'Color','w')
filename=[Fig_dir,'/SIT'];
%export_fig(gcf,filename,'-a1','-pdf');
%export_fig(gcf,filename,'-a1','-tif','-r864','-painters');
export_fig(gcf,filename,'-a1','-png','-r864','-painters');



