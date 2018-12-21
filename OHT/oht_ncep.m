nc64startup

f=netcdf('oht_980.nc')
oht_980=f{'OHT_980'}(:);
lat_980=f{'YQ'}(:);

f=netcdf('oht_986.nc')
oht_986=f{'OHT_986'}(:);
lat_986=f{'YQ1'}(:);

f=netcdf('oht_987.nc')
oht_987=f{'OHT_987'}(:);

f=netcdf('ANNUAL_TRANSPORTS_1985_1989.nc')
oht_n=f{'OTn'}(:);
lat_n=f{'latitude'}(:);

oht_gw=[0.6,1.8,-0.8,-0.6];
lat_gw=[47,24,-19,-30];
ohterr_gw=[0.1,0.3,0.6,0.3]

figure
plot(lat_980,oht_980,'k')
hold
plot(lat_986,oht_986,'b')
plot(lat_986,oht_987,'r')
plot(lat_n,oht_n,'ko')
errorbar(lat_gw,oht_gw,ohterr_gw,'m*')

axis([-78 90 -2 2.2])
legend ('OM4p25','OM4p5','OM4p5n','NCEP','G&W')
xlabel('Latitude')
ylabel('PW')
Title('Northward Global Ocean Heat Transport')
grid


