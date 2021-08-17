function out = getInducedVoltageBenchmark(app,ntg,faulted_tower)

file = [];
programName = [];

if isFaultStudy(app)
    if exist(app.Target(ntg).Benchmark.InducedVoltageFile(faulted_tower).Text)
        file = load(app.Target(ntg).Benchmark.InducedVoltageFile(faulted_tower).Text);
        file = file(:,2:4);
        programName = app.Target(ntg).Benchmark.InducedVoltageProgram(faulted_tower).Text;
    end
elseif isEnergizationStudy(app)
    % Benchmark file:
    if exist(app.Target(ntg).Benchmark.EnergizationInducedVoltageFile.Text)
        file = load(app.Target(ntg).Benchmark.EnergizationInducedVoltageFile.Text);
        file = file(:,2:4);
        % Benchmark Program (SESTLC or ROW)
        programName = app.Target(ntg).Benchmark.EnergizationInducedVoltageProgram.Text;
    end
elseif isCBSwitchingStudy(app)
    % Benchmark file:
    if exist(app.Target(ntg).Benchmark.CBSwithingInducedVoltageFile.Text)
        file = load(app.Target(ntg).Benchmark.CBSwithingInducedVoltageFile.Text);
        file = file(:,2:4);
        % Benchmark Program (SESTLC or ROW)
        programName = app.Target(ntg).Benchmark.CBSwithingInducedVoltageProgram.Text;
    end
else
    % Benchmark file:
    if exist(app.Target(ntg).Benchmark.NLInducedVoltageFile.Text)
        file = load(app.Target(ntg).Benchmark.NLInducedVoltageFile.Text);
        file = file(:,2:4);
        % Benchmark Program (SESTLC or ROW)
        programName = app.Target(ntg).Benchmark.NLInducedVoltageProgram.Text;
    end
end

out.file = file;
out.name = programName;

end
