rho=[8600 21575 19146 4460 3151];
h = [.64 .29 3.47 7.4];
f=60;

a_m=[1 2 4 8 16 32];
rho_m=[11938 15707 17341 11058 5026 3820];



% load('soil_measurements.mat')

% rho_eq= 1/multilayer_equivalent( rho, h, f )
% rho_unif= mean(rho)

figure;
set_plot_params
plotresap(a_m, rho_m, [rho h], [])
save2pdf('D:\Mestrado\MyPapers\(2021,WCNPS) Accounting for Pipeline Interference and Soil Stratification on Overhead Line Parameters A Solution for Protective Relays and Fault Locators\Graficos\soilmodel.pdf')
 