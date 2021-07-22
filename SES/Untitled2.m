
clear
close all

dt=getATPdeltaT(app);
f = getFrequency(app);

% nsec = getNumSections(app);
% 
% seq_target = 'ABCDEFGHIJKLMNOPQRSTUWVXYZ';
% 
% ntg = 1;

fname=sprintf('SES_nominal_load_study.mat');
load(fname);
dist = [50;100;150;200;250;300;350;400;450;500;550;600;650;700;750;800;850;900];
% function plotInducedVoltage(file,AccDistance,ntg,dT,tw)

% for k=0:nsec
% varname=sprintf('vTerra%s%04d',seq_target(ntg),k);
% orig_state = warning;warning('off','all')
% phasordata=sineFit(t(end-2*tw:end),eval(sprintf('%s(end-2*tw:end)',varname)));
% vTarget(k+1)=phasordata(2);
% end
% warning(orig_state);
%% Vertical
% NO TRANSPOSITION:
% CDEGS = [0,0.827700000000000;50,0.789400000000000;100,0.902100000000000;150,1.12100000000000;200,1.39700000000000;250,1.70300000000000;300,2.02500000000000;350,2.35700000000000;400,2.69500000000000;450,3.03600000000000;500,3.38100000000000;550,3.38400000000000;600,3.38700000000000;650,2.82800000000000;700,2.27900000000000;750,1.75000000000000;800,1.26400000000000;850,0.897900000000000;900,0.827400000000000];
% TRANSPOSITION:
CDEGS = [0,0.938300000000000;50,0.483700000000000;100,0.0433200000000000;150,0.429000000000000;200,0.883400000000000;250,1.33800000000000;300,1.79300000000000;350,2.24800000000000;400,2.70300000000000;450,3.15900000000000;500,3.61400000000000;550,3.61300000000000;600,3.61300000000000;650,3.15600000000000;700,2.70000000000000;750,2.24300000000000;800,1.78700000000000;850,1.33100000000000;900,0.875000000000000];
CDEGS = [];
[indVoltage, error] = plotInducedVoltage(fname,[0;dist],dt,f,CDEGS,1,'SES Horizontal 14" Pipe');


% x = app.CoupRegTable.AccTargetDistance.Data(end) - [0;app.CoupRegTable.AccTargetDistance.Data];
% 
% EstimateVoltage = interp1(CDEGS(:,1),CDEGS(:,2),x);
% 
% NRMSE_error = NRMSE(flip(vTarget),transpose(EstimateVoltage));
% 
% set_plot_params;
% 
% % figure;
% % plot(app.CoupRegTable.AccTargetDistance.Data(end) - [0;app.CoupRegTable.AccTargetDistance.Data],vTarget,'r',CDEGS(:,1),CDEGS(:,2),'k^')
% % title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
% % ylabel('Voltage [V]')
% % xlabel('Distance along pipeline [m]')
% % legend('EMISimu','CDEGS')
% % xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])
% % ylim([0 max(vTarget)])
% 
% figure;
% h = plot([0;app.CoupRegTable.AccTargetDistance.Data],vTarget,'r',CDEGS(:,1),CDEGS(:,2),'k^',[0;app.CoupRegTable.AccTargetDistance.Data],nan(size([0;app.CoupRegTable.AccTargetDistance.Data])));
% 
% ylabel('Induced Voltage [V]')
% xlabel('Distance along pipeline [m]')
% xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])
% [~, objH] = legend(h([1 2 3]), 'EMISimu', 'CDEGS', 'junk');  % Reorder handles
% set(findobj(objH, 'Tag', 'junk'), 'Vis', 'off');           % Make "junk" lines invisible
% pos = get(objH(3), 'Pos');                                 % Get text box position
% set(objH(3), 'Pos', [0.1 pos(2:3)], 'String', [sprintf('e_{NRMS} = %.2f',NRMSE_error) '%']);  % Stretch box and change text
% 
% 
% % 
% % figure;
% % plot([0;app.CoupRegTable.AccTargetDistance.Data],vTarget)
% % title(sprintf('Nominal Load Ind. Voltage (%s), NRMSE = %.1f',seq_target(ntg),NRMSE_error));
% % ylabel('Voltage [V]')
% % xlabel('Distance along pipeline [m]')
% % legend('EMISimu','CDEGS')
% % xlim([0 app.CoupRegTable.AccTargetDistance.Data(end)])

