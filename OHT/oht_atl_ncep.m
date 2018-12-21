nc64startup

f=netcdf('oht_atl_980.nc')
oht_980=f{'OHT_980'}(:);
lat_980=f{'YQ'}(:);

f=netcdf('oht_atl_986.nc')
oht_986=f{'OHT_986'}(:);
lat_986=f{'YQ1'}(:);

f=netcdf('oht_atl_987.nc')
oht_987=f{'OHT_987'}(:);

f=netcdf('ANNUAL_TRANSPORTS_1985_1989.nc')
oht_n=f{'ATLn'}(:);
lat_n=f{'latitude'}(:);

oht_gw=[0.6, 1.27, 1.26, 1, 0.9, 0.77, 0.35, 0.66];
lat_gw=[47, 24, 7.5, -4.5, -11, -19, -30, -45 ];
ohterr_gw=[0.09, 0.15, 0.31, 0.55, 0.4,0.2, 0.15, 0.12 ];

figure
plot(lat_980,oht_980,'k')
hold
plot(lat_986,oht_986,'b')
plot(lat_986,oht_987,'r')
plot(lat_n,oht_n,'ko')
errorbar(lat_gw,oht_gw,ohterr_gw,'m*')
axis([-34 90 0 1.6])
legend ('OM4p25','OM4p5','OM4p5n','NCEP','G&W')
xlabel('Latitude')
ylabel('PW')
Title('Northward Atlantic Heat Transport')
grid


