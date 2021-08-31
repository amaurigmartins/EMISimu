function out = plotTLCurrent(file,terminal,circuit,plot_title)

load(file);

if terminal==1
    termIdx=0;
elseif terminal==2
    termIdx=getNumSections(app);
end


set_plot_params;

varnamePhaseA=sprintf('iTh%dt%da10000a',circuit,terminal);
varnamePhaseB=sprintf('iTh%dt%db10000b',circuit,terminal);
varnamePhaseC=sprintf('iTh%dt%dc10000c',circuit,terminal);

currentPhaseA = eval(varnamePhaseA);
currentPhaseB = eval(varnamePhaseB);
currentPhaseC = eval(varnamePhaseC);

figure;
plot(t*1e3,currentPhaseA,'r'); hold on
plot(t*1e3,currentPhaseB,'color',rgb('kelly green')); hold on
plot(t*1e3,currentPhaseC,'b');
title(plot_title)
ylabel('Current [A]')
xlabel('Time [ms]')
xlim([0 t(end)*1e3])
legend('Phase A','Phase B','Phase C');

varnamePhaseA=sprintf('v%d%04da',circuit,termIdx);
varnamePhaseB=sprintf('v%d%04db',circuit,termIdx);
varnamePhaseC=sprintf('v%d%04dc',circuit,termIdx);

voltagePhaseA = eval(varnamePhaseA);
voltagePhaseB = eval(varnamePhaseB);
voltagePhaseC = eval(varnamePhaseC);

figure;
plot(t*1e3,voltagePhaseA,'r'); hold on
plot(t*1e3,voltagePhaseB,'color',rgb('kelly green')); hold on
plot(t*1e3,voltagePhaseC,'b'); hold on
title(plot_title)
ylabel('Voltage [V]')
xlabel('Time [ms]')
xlim([0 t(end)*1e3])
legend('Phase A','Phase B','Phase C');

end















