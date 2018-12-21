nc64startup

f=netcdf('moc_atl_980_bottom_26_5N.nc')
moc_980=f{'MOC_ATL'}(:);
moc_980=[1.1,moc_980'];

f=netcdf('moc_atl_986_bottom_26_5N.nc')
moc_986=f{'MOC_ATL'}(:);
moc_986=[1.0,moc_986'];

f=netcdf('moc_atl_987_bottom_26_5N.nc')
moc_987=f{'MOC_ATL'}(:);
moc_987=[1.2,moc_987'];

f=netcdf('moc_vertical_ave_2004_2015.nc')
moc_rapid=f{'MOC_AVE'}(:);
depth_rapid=-f{'DEPTH'}(:);

depth=-[0 5 15 25 40 62.5 87.5 112.5 137.5 175 225 275 350 450 550 650 750 850 950 1050 1150 1250 1350 1450 1625 1875 2250 2750 3250 3750 4250 4750 5250 5750 6250 6750];

figure
plot(moc_980,depth,'b','LineWidth',2)
hold
plot(moc_986,depth,'r','LineWidth',2)
plot(moc_987,depth,'m','LineWidth',2)
plot(moc_rapid,depth_rapid,'k','LineWidth',3)
legend ('OM4p25','OM4p5','OM4p5n','RAPID')
axis([-5 20 -6000 0])
xlabel('AMOC at 26N (Sv)')
ylabel('Depth (m)')
grid




