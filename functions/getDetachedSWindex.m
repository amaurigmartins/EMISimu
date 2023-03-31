function out = getDetachedSWindex(app)

numAttSets = length(app.AttSet(:));
nsh = getNumShieldWires(app);

out = 0;

for thisattset = 1: numAttSets
    if nsh > 0
        for j = 1: nsh
            if ~strcmp(app.AttSet(thisattset).ShieldWire(j).KronReduction.Text,'Yes')
                out = 1;
            end
        end
    end
end

end