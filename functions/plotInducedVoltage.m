function [indVoltage, error] = plotInducedVoltage(file,AccDistance,dT,f,benchmark,ntg,plot_title)

tw=1/f/dT;

seq_target = 'ABCDEFGHIJKLMNOPQRSTUWVXYZ';

load(file);

nsec = size(AccDistance,1) - 1;

set_plot_params;

for k=0:nsec
    varname=sprintf('vTerra%s%04d',seq_target(ntg),k);
    orig_state = warning;warning('off','all')
    phasorData=sineFit(t(end-2*tw:end),eval(sprintf('%s(end-2*tw:end)',varname)));
    indVoltage(k+1,1)= phasorData(2);
    indVoltage(k+1,2)= phasorData(4);
end
warning(orig_state);

if ~isempty(benchmark.file)
    
    InducedVoltage = indVoltage(:,1);
    EstimateVoltage = interp1(benchmark.file(:,1),benchmark.file(:,2),AccDistance);
    
    [nan_row, ~] = find(isnan(EstimateVoltage));
    if ~isempty(nan_row)
        EstimateVoltage(nan_row,:) = [];
        InducedVoltage(nan_row,:) = [];
    end
    
    error = NRMSE(transpose(InducedVoltage),transpose(EstimateVoltage));
    
    figure;
    h = plot(AccDistance,indVoltage(:,1),'r',benchmark.file(:,1),benchmark.file(:,2),'k:',AccDistance,nan(size(AccDistance)));
    title(plot_title)
    ylabel('Induced voltage [V]')
    xlabel('Distance along pipeline [m]')
    xlim([0 AccDistance(end)])
    [~, objH] = legend(h([1 2 3]), 'EMISimu', benchmark.name, 'junk');  % Reorder handles
    set(findobj(objH, 'Tag', 'junk'), 'Vis', 'off');           % Make "junk" lines invisible
    pos = get(objH(3), 'Pos');                                 % Get text box position
    set(objH(3), 'Pos', [0.05 pos(2:3)], 'String', [sprintf('e_{NRMS} = %.2f',error) '%']);  % Stretch box and change text
    
else
    error = 0;
    
    figure;
    plot(AccDistance,indVoltage(:,1),'r');
    title(plot_title)
    ylabel('Induced voltage [V]')
    xlabel('Distance along pipeline [m]')
    xlim([0 AccDistance(end)])
end
    


end
    
