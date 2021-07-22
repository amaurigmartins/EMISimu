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
                fname=strcat(projID,'_fault_sec',sprintf('%d',faulted_towers(j)),'.mat');
                DisplayName = getTargetDisplayName(app,ntg);
                DisplayName = strcat(DisplayName,sprintf(', Faulted tower = %d',faulted_towers(j)));
                Benchmark = getInducedVoltageBenchmark(app,i,faulted_towers(j));
                [indVoltage, error] = plotInducedVoltage(fname,AccDistance,dT,f,Benchmark,i,DisplayName);
                app.Results.Target(i).InducedVoltage(j).Amplitude.Data = indVoltage(:,1);
                app.Results.Target(i).InducedVoltage(j).Angle.Data = indVoltage(:,2);
                app.Results.Target(i).InducedVoltageError(j).Value = error;
            else
                fname=strcat(projID,'_nominal_load_study','.mat');
                DisplayName = getTargetDisplayName(app,ntg);
                Benchmark = getInducedVoltageBenchmark(app,i,faulted_towers(j));
                [indVoltage, error] = plotInducedVoltage(fname,AccDistance,dT,f,Benchmark,i,DisplayName);
                app.Results.Target(i).NLInducedVoltage.Amplitude.Data = indVoltage(:,1);
                app.Results.Target(i).NLInducedVoltage.Angle.Data = indVoltage(:,2);
                app.Results.Target(i).NLInducedVoltageError.Value = error;
            end
    end
end
    


