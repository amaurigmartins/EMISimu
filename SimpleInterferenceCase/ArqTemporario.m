app.AttSet(1).Phase(1).condID.Value = 'Peacock';
app.AttSet(1).Phase(1).numberofCond.Value = 2;
app.AttSet(1).Phase(1).spaceBetweenCond.Value = 0.4;
app.AttSet(1).Phase(1).coordX.Value = -1;
app.AttSet(1).Phase(1).coordY.Value = 20;
app.AttSet(1).Phase(2).condID.Value = 'Peacock';
app.AttSet(1).Phase(2).numberofCond.Value = 2;
app.AttSet(1).Phase(2).spaceBetweenCond.Value = 0.4;
app.AttSet(1).Phase(2).coordX.Value = 0;
app.AttSet(1).Phase(2).coordY.Value = 20;
app.AttSet(1).Phase(3).condID.Value = 'Peacock';
app.AttSet(1).Phase(3).numberofCond.Value = 2;
app.AttSet(1).Phase(3).spaceBetweenCond.Value = 0.4;
app.AttSet(1).Phase(3).coordX.Value = 1;
app.AttSet(1).Phase(3).coordY.Value = 20;
app.AttSet(1).ShieldWire(1).condID.Value = 'Steel 3/8 EHS';
% app.AttSet(1).numberofCond(4).Value = 1;
% app.AttSet(1).spaceBetweenCond(4).Value = 0;
app.AttSet(1).ShieldWire(1).coordX.Value = 0;
app.AttSet(1).ShieldWire(1).coordY.Value = 22;
app.AttSet(1).Target(1).condID.Value = 'Pipe 16" STD';
% app.AttSet(1).numberofCond(5).Value = 1;
% app.AttSet(1).spaceBetweenCond(5).Value = 0;
app.AttSet(1).Target(1).coordX.Value = 0;
app.AttSet(1).Target(1).coordY.Value = -1;

numAttSets = length(app.AttSet(:));
numPhases = length(app.AttSet.Phase(:));
numShieldWires = length(app.AttSet.ShieldWire(:));
numTargets = length(app.AttSet.Target(:));

for i = 1: numAttSets
    
    for j = 1: numPhases
        attsetdata{j,1} = app.AttSet(i).Phase(j).condID.Value;
        attsetdata{j,2} = app.AttSet(i).Phase(j).numberofCond.Value;
        attsetdata{j,3} = app.AttSet(i).Phase(j).spaceBetweenCond.Value;
        attsetdata{j,4} = app.AttSet(i).Phase(j).coordX.Value;
        attsetdata{j,5} = app.AttSet(i).Phase(j).coordY.Value;
    end
    
    app.TableAttSet.Data(i) = cell2struct(attsetdata);
end