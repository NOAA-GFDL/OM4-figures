%run this script to produce OM4 sea ice analysis (load and process data, compute diagnostics, make figures)

addpath('./utils/')

%%%%%load and process raw data

%OM4p25
model{1}='OM4p25';
run{1}='OM4p25_IAF_BLING_CFC_csf_rerun';
rootdir{1}='/archive/ogrp/CMIP6/OMIP/warsaw_201803_mom6_2018.04.06/OM4p25_IAF_BLING_csf_rerun/gfdl.ncrc3-intel16-prod/pp';
year_start{1}=1948;
year_end{1}=2007;
delta_year{1}=20;
work_dir{1}='/work/mib';

%OM4p5
model{2}='OM4p5';
run{2}='OM4p5_IAF_BLING_CFC_abio_csf_mle200';
rootdir{2}='/archive/oar.gfdl.bgrp-account/CMIP6/OMIP/warsaw_201803_mom6_2018.04.11/OM4p5_IAF_BLING_CFC_abio_csf_mle200/gfdl.ncrc4-intel16-prod/pp';
year_start{2}=1948;
year_end{2}=2007;
delta_year{2}=5;
work_dir{2}='/work/mib';

%OM4p5n
model{3}='OM4p5';
run{3}='OM4p5_IAF_BLING_CFC_abio_csf_p25config';
rootdir{3}='/archive/oar.gfdl.bgrp-account/CMIP6/OMIP/warsaw_201803_mom6_2018.04.11/OM4p5_IAF_BLING_CFC_abio_csf_p25config/gfdl.ncrc4-intel16-prod/pp';
year_start{3}=1948;
year_end{3}=2007;
delta_year{3}=20;
work_dir{3}='/work/mib';

comp='ice';
var_list={'siconc','sithick'};

for j=1:length(model)
for k=1:length(var_list)

gfdlRawData_loop(model{j},run{j},comp,var_list{k},rootdir{j},year_start{j},year_end{j},delta_year{j},work_dir{j})

end 
end


%%%%%compute diagnostics and make figures

Fig_dir='/home/Mitchell.Bushuk/Figures/CM4_CORE2/paper_figs';

OM4_paper_figs(Fig_dir)



















