
dt=app.deltaT.Value;
tw=1/app.LCCfrequency.Value/dt;

nsec = getNumSections(app);

seq_target = 'ABCDEFGHIJKLMNOPQRSTUWVXYZ';

ntg = 1;

fname=sprintf('nominal_load_study.mat');
load(fname);
for k=0:nsec
varname=sprintf('vTerra%s%04d',seq_target(ntg),k);
% phasordata=sineFit(t(end-2*tw:end),eval(sprintf('%s(end-2*tw:end)',varname)));
phasordata = max(eval(varname));
vTarget(k+1)=phasordata;
end


% NO CURRENT:
% CDEGS = [0,1.39100000000000;50,1.23000000000000;100,1.06900000000000;150,0.907500000000000;200,0.746400000000000;250,0.585400000000000;300,0.424400000000000;350,0.263400000000000;400,0.102600000000000;450,0.0597400000000000;500,0.220200000000000;550,0.219400000000000;600,0.218800000000000;650,0.413700000000000;700,0.609200000000000;750,0.804800000000000;800,1;850,1.19600000000000;900,1.39200000000000];
% WITH CPR CURRENT:
CDEGS = [0,3.83100000000000;50,3.36300000000000;100,2.89400000000000;150,2.42600000000000;200,1.95800000000000;250,1.49000000000000;300,1.02300000000000;350,0.556600000000000;400,0.110200000000000;450,0.391200000000000;500,0.855900000000000;550,0.851500000000000;600,0.847400000000000;650,1.34400000000000;700,1.84000000000000;750,2.33700000000000;800,2.83500000000000;850,3.33200000000000;900,3.82900000000000];



x = app.CoupRegTable.AccTargetDistance.Data(end) - [0;app.CoupRegTable.AccTargetDistance.Data];

EstimateVoltage = interp1(CDEGS(:,1),CDEGS(:,2),x);

NRMSE_error = NRMSE(flip(vTarget),transpose(EstimateVoltage));

set_plot_params;

% figure;
% plot(app.CoupRegTable.AccTargetDistance.Data(end) - [0;app.CoupRegTable.AccTargetDistance.Data],vTarget,'r',CDEGS(:,1),CDEGS(:,2),'k^')
% title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
% ylabel('Voltage [V]')
% xlabel('Distance along pipeline [m]')
% legend('EMISimu','CDEGS')
% xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])
% ylim([0 max(vTarget)])

figure;
plot([0;app.CoupRegTable.AccTargetDistance.Data],vTarget,'r',CDEGS(:,1),CDEGS(:,2),'k^')
title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
ylabel('Voltage [V]')
xlabel('Distance along pipeline [m]')
legend('EMISimu','CDEGS')
xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])
% 
figure;
plot([0;app.CoupRegTable.AccTargetDistance.Data],vTarget)
title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
ylabel('Voltage [V]')
xlabel('Distance along pipeline [m]')
legend('EMISimu','CDEGS')
xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])

