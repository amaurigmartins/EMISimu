%% Ground impedance data table convert:
app.UITableGroundImp.Data = num2cell(app.UITableGroundImp.Data);

%% Tower to ground output specify sections table convert:
Tow2Ground_transf = cell2mat(struct2cell(app.Tow2Ground));
Tow2Ground_transf = struct2cell(Tow2Ground_transf);

Tow2Ground_Table(:,1) = Tow2Ground_transf(:,1,:);
Tow2Ground_Table(:,2) = Tow2Ground_transf(:,2,:);

app.UITableTow2Ground.Data = num2cell(Tow2Ground_Table);

%% Shield wires currents output specify sections table convert:

SHCurr_transf = cell2mat(struct2cell(app.ShieldCurr));
SHCurr_transf = struct2cell(SHCurr_transf);

ShieldCurr_Table(:,1) = SHCurr_transf(:,1,:);
ShieldCurr_Table(:,2) = SHCurr_transf(:,2,:);

app.UITableSWCurr.Data = num2cell(ShieldCurr_Table);

%% AttSet specify sections table convert:

AttSet_transf = cell2mat(struct2cell(app.AttSetSec));
AttSet_transf = struct2cell(AttSet_transf);

AttSet_Table(:,1) = AttSet_transf(:,1,:);
AttSet_Table(:,2) = AttSet_transf(:,2,:);
AttSet_Table(:,3) = AttSet_transf(:,3,:);

app.UITableAttSetSec.Data = num2cell(AttSet_Table);

%% Number of circuits:

if app.NumberofCircuits.Value == 1
    app.DoublecircuitButton.Value = 0;
    app.SinglecircuitButton.Value = 1;
else
    app.DoublecircuitButton.Value = 1;
    app.SinglecircuitButton.Value = 0;
end

%% Number of shield wires:

if app.NumberofShieldWires.Value == 1
   
    % None shield wires:
    app.NoneSW.Value = 0;
    % Single shield wires:
    app.SingleSW.Value = 1;
    % Doble shield wires:
    app.DoubleSW.value = 0;
    
elseif app.NumberofShieldWires.Value == 2
    
    % None shield wires:
    app.NoneSW.Value = 0;
    % Single shield wires:
    app.SingleSW.Value = 0;
    % Doble shield wires:
    app.DoubleSW.value = 1;
    
else % app.NumberofShieldWires.Value == 0
   
    % None shield wires:
    app.NoneSW.Value = 1;
    % Single shield wires:
    app.SingleSW.Value = 0;
    % Doble shield wires:
    app.DoubleSW.value = 0;
end

%% Faulted circuit number:

if app.Faultedcircuit.Value == 1
    app.Faultedcircuit.SelectedObject.Text = 'Circuit 1';
else
    app.Faultedcircuit.SelectedObject.Text = 'Circuit 2';
end

%% Fault type:

if app.FaulttypeFTYPEButtonGroup.Value == 1
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '1 - AG';
elseif app.FaulttypeFTYPEButtonGroup.Value == 2
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '2 - BG';
elseif app.FaulttypeFTYPEButtonGroup.Value == 3
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '3 - CG';
elseif app.FaulttypeFTYPEButtonGroup.Value == 4
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '4 - AB';
elseif app.FaulttypeFTYPEButtonGroup.Value == 5
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '5 - BC';
elseif app.FaulttypeFTYPEButtonGroup.Value == 6
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '6 - CA';
elseif app.FaulttypeFTYPEButtonGroup.Value == 7
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '7 - ABG';
elseif app.FaulttypeFTYPEButtonGroup.Value == 8
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '8 - BCG';
elseif app.FaulttypeFTYPEButtonGroup.Value == 9
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '9 - CAG';
elseif app.FaulttypeFTYPEButtonGroup.Value == 10
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '10 - ABC';
elseif app.FaulttypeFTYPEButtonGroup.Value == 11
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '11 - ABCG';
end

%% Line model:

if strcmp(app.LineModel,'pi')
    app.PiButton.Value = 1;
    app.BergeronButton.Value = 0;
elseif strcmp(app.LineModel,'bergeron')
    app.PiButton.Value = 0;
    app.BergeronButton.Value = 1;
else
    app.PiButton.Value = 0;
    app.BergeronButton.Value = 0;
end

%% Organize AttSet Data Table:

numAttSets = length(app.AttSet(:));

nph = getNumPhases(app);
nsh = getNumShieldWires(app);
ntg = getNumTargets(app);

for thisattset = 1: numAttSets
    
    attsetdata = [];
    
    for j = 1: nph
        attsetdata{j,1} = app.AttSet(thisattset).Phase(j).condID.Value;
        attsetdata{j,2} = app.AttSet(thisattset).Phase(j).numberofCond.Value;
        attsetdata{j,3} = app.AttSet(thisattset).Phase(j).spaceBetweenCond.Value;
        attsetdata{j,4} = app.AttSet(thisattset).Phase(j).coordX.Value;
        attsetdata{j,5} = app.AttSet(thisattset).Phase(j).coordY.Value;
        attsetdata{j,6} = 'Phase'; % type
    end
    
    if nsh > 0
        for j = 1: nsh
            attsetdata{j+nph,1} = app.AttSet(thisattset).ShieldWire(j).condID.Value;
            attsetdata{j+nph,2} = 0; %one conductor per phase
            attsetdata{j+nph,3} = 0; %one conductor per phase
            attsetdata{j+nph,4} = app.AttSet(thisattset).ShieldWire(j).coordX.Value;
            attsetdata{j+nph,5} = app.AttSet(thisattset).ShieldWire(j).coordY.Value;
            attsetdata{j+nph,6} = 'ShieldWire'; % type
        end
    end
    
    if ntg > 0
        for j = 1 : ntg
            attsetdata{j+ nph + nsh,1} = app.AttSet(thisattset).Target(j).condID.Value;
            attsetdata{j+ nph + nsh,2} = 0; %one conductor per phase
            attsetdata{j+ nph + nsh,3} = 0; %one conductor per phase
            attsetdata{j+ nph + nsh,4} = app.AttSet(thisattset).Target(j).coordX.Value;
            attsetdata{j+ nph + nsh,5} = app.AttSet(thisattset).Target(j).coordY.Value;
            attsetdata{j+ nph + nsh,6} = 'Target'; % type
        end
    end
    
    structArray = cell2struct(attsetdata, {'conductor', 'bundled', 'bundle_spac','horizontal','vertical','type'},2);
    app.UITableAttSets.Data(thisattset)=cellstr(jsonencode(structArray));
end
