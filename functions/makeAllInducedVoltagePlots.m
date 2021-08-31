function makeAllInducedVoltagePlots(app)

faulted_towers = getFaultedSections(app);
numfiles=length(TowNum2LCC(app,getFaultedSections(app)));
ntg = getNumTargets(app);

projID = getProjectID(app);
dT = getATPdeltaT(app);
f = getFrequency(app);

AccDistance = [0;getTargetAccDistance(app)];

disp('Running induced voltage plots...');

for i=1:ntg
    for j=1:numfiles
            if isFaultStudy(app)
                fname=strcat(projID,sprintf('_%sfault_sec',getFaultTypeName(app)),sprintf('%d',faulted_towers(j)),'.mat');
                DisplayName = getTargetDisplayName(app,ntg);
                fprintf('Plotting induced voltages on target %s for fault at tower %d...\n',DisplayName,faulted_towers(j));
                DisplayName = strcat(DisplayName,sprintf(', Faulted tower = %d',faulted_towers(j)));
                Benchmark = getInducedVoltageBenchmark(app,i,faulted_towers(j));
                [indVoltage, error] = plotInducedVoltage(fname,AccDistance,dT,f,Benchmark,i,DisplayName);
                app.Target(i).Results.InducedVoltage(j).Amplitude.Data = indVoltage(:,1);
                app.Target(i).Results.InducedVoltage(j).Angle.Data = indVoltage(:,2);
                app.Target(i).Results.InducedVoltage(j).Error.Value = error;
            
            elseif isEnergizationStudy(app)
                fname=strcat(projID,'_energization_study','.mat');
                DisplayName = getTargetDisplayName(app,ntg);
                fprintf('Plotting induced voltages on target %s under energization transient conditions...\n',DisplayName);
                Benchmark = getInducedVoltageBenchmark(app,i,faulted_towers(j));
                [indVoltage, error] = plotInducedVoltage(fname,AccDistance,dT,f,Benchmark,i,DisplayName);
                app.Target(i).Results.EnergizationInducedVoltage.Amplitude.Data = indVoltage(:,1);
                app.Target(i).Results.EnergizationInducedVoltage.Angle.Data = indVoltage(:,2);
                app.Target(i).Results.EnergizationInducedVoltage.Error.Value = error;
            elseif isCBSwitchingStudy(app)
                fname=strcat(projID,'_CBswitching_study','.mat');
                DisplayName = getTargetDisplayName(app,ntg);
                fprintf('Plotting induced voltages on target %s under capacitor bank switching transient conditions...\n',DisplayName);
                Benchmark = getInducedVoltageBenchmark(app,i,faulted_towers(j));
                [indVoltage, error] = plotInducedVoltage(fname,AccDistance,dT,f,Benchmark,i,DisplayName);
                app.Target(i).Results.EnergizationInducedVoltage.Amplitude.Data = indVoltage(:,1);
                app.Target(i).Results.EnergizationInducedVoltage.Angle.Data = indVoltage(:,2);
                app.Target(i).Results.EnergizationInducedVoltage.Error.Value = error;
            else
                fname=strcat(projID,'_nominal_load_study','.mat');
                DisplayName = getTargetDisplayName(app,ntg);
                fprintf('Plotting induced voltages on target %s under nominal load conditions...\n',DisplayName);
                Benchmark = getInducedVoltageBenchmark(app,i,faulted_towers(j));
                [indVoltage, error] = plotInducedVoltage(fname,AccDistance,dT,f,Benchmark,i,DisplayName);
                app.Target(i).Results.NLInducedVoltage.Amplitude.Data = indVoltage(:,1);
                app.Target(i).Results.NLInducedVoltage.Angle.Data = indVoltage(:,2);
                app.Target(i).Results.NLInducedVoltage.Error.Value = error;
            end
    end
end

disp('Induced voltage plots ended!')


