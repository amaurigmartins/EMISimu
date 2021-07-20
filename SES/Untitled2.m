
dt=app.deltaT.Value;
tw=1/app.LCCfrequency.Value/dt;

nsec = getNumSections(app);

seq_target = 'ABCDEFGHIJKLMNOPQRSTUWVXYZ';

ntg = 1;

fname=sprintf('nominal_load_study.mat');
load(fname);
for k=0:nsec
varname=sprintf('vTerra%s%04d',seq_target(ntg),k);
phasordata=sineFit(t(end-2*tw:end),eval(sprintf('%s(end-2*tw:end)',varname)));
vTarget(k+1)=phasordata(2);
end

CDEGS = [0,0.546321232478559;479.050000000000,0.570033376097463;796.130000000000,0.570745490315115;1270.76000000000,0.628610497710254;1501.16000000000,0.520453904206519;1643.38000000000,0.435561465605483;1837.08000000000,0.329887938357224;2020.96000000000,0.241375225330000;2061.09000000000,0.216305332978903;2116.98000000000,0.182511640701437;2195.10000000000,0.143727200026423;2299.76000000000,0.0955260461875909;2413.29000000000,0.0435310426654388;2565.80000000000,0.353333755094168;2684.53000000000,0.498037751292553;2946.97000000000,0.574305725770856;3160.78000000000,0.560158650572119;3233.86000000000,0.553239946342086;3432.43000000000,0.546699380698172;3515.88000000000,0.546302231526258];

x = app.CoupRegTable.AccTargetDistance.Data(end) - [0;app.CoupRegTable.AccTargetDistance.Data];

EstimateVoltage = interp1(CDEGS(:,1),CDEGS(:,2),x);

NRMSE_error = NRMSE(flip(vTarget),transpose(EstimateVoltage));

set_plot_params;

figure;
plot(app.CoupRegTable.AccTargetDistance.Data(end) - [0;app.CoupRegTable.AccTargetDistance.Data],vTarget)
title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
ylabel('Voltage [V]')
xlabel('Distance along pipeline [m]')
legend('EMISimu','CDEGS')
xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])
% ylim([0 max(vTarget)])

% figure;
% plot([0;app.CoupRegTable.AccTargetDistance.Data],vTarget,'r',CDEGS(:,1),CDEGS(:,2),'k^')
% title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
% ylabel('Voltage [V]')
% xlabel('Distance along pipeline [m]')
% legend('EMISimu','CDEGS')
% xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])

figure;
plot([0;app.CoupRegTable.AccTargetDistance.Data],vTarget)
title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
ylabel('Voltage [V]')
xlabel('Distance along pipeline [m]')
legend('EMISimu','CDEGS')
xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])

