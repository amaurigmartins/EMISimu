function out = isEnergizedCircuit(app,circuit)

out = 0;

if isEnergizationStudy(app)
    if strcmp(app.EnergizedCircuit.Text,'Both')
        out = 1;
    else
        if circuit == 1
            out = strcmp(app.EnergizedCircuit.Text,'Circuit 1');
        elseif circuit == 2
            out = strcmp(app.EnergizedCircuit.Text,'Circuit 2');
        end
    end
end

end