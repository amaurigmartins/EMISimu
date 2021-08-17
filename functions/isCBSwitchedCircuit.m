function out = isCBSwitchedCircuit(app,circuit)

out = 0;

if isCBSwitchingStudy(app)
    if strcmp(app.CBSwitchedCircuit.Text,'Both')
        out = 1;
    else
        if circuit == 1
            out = strcmp(app.CBSwitchedCircuit.Text,'Circuit 1');
        elseif circuit == 2
            out = strcmp(app.CBSwitchedCircuit.Text,'Circuit 2');
        end
    end
end

end