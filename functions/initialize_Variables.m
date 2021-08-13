
%% Load Ground impedance table

app.UITableGroundImp.Data = load(getGroundImpedancePath(app));

%% Load Soil resistivity table
app.UITableSoilRes.Data = load(getSoilResistivityPath(app));

%% Ground impedance data table convert:
app.UITableGroundImp.Data = num2cell(app.UITableGroundImp.Data);

%% Tower to ground output specify sections table convert:
Tow2Ground_transf = cell2mat(struct2cell(app.Tow2Ground));
Tow2Ground_transf = struct2cell(Tow2Ground_transf);

Tow2Ground_Table(:,1) = Tow2Ground_transf(:,1,:);
Tow2Ground_Table(:,2) = Tow2Ground_transf(:,2,:);

app.UITableTow2Ground.Data = string(Tow2Ground_Table);

%% Shield wires currents output specify sections table convert:

SHCurr_transf = cell2mat(struct2cell(app.ShieldCurr));
SHCurr_transf = struct2cell(SHCurr_transf);

ShieldCurr_Table(:,1) = SHCurr_transf(:,1,:);
ShieldCurr_Table(:,2) = SHCurr_transf(:,2,:);

app.UITableSWCurr.Data = string(ShieldCurr_Table);

%% AttSet specify sections table convert:

AttSet_transf = cell2mat(struct2cell(app.AttSetSec));
AttSet_transf = struct2cell(AttSet_transf);

AttSet_Table(:,1) = AttSet_transf(:,1,:);
AttSet_Table(:,2) = AttSet_transf(:,2,:);
AttSet_Table(:,3) = AttSet_transf(:,3,:);

app.UITableAttSetSec.Data = string(AttSet_Table);

%% Number of circuits:

if strcmp(app.LineConfig.Text,'single')
    app.NumberofCircuits.Value = 1;
    
    app.DoublecircuitButton.Value = 0;
    app.SinglecircuitButton.Value = 1;
else
    app.NumberofCircuits.Value = 2;
    app.DoublecircuitButton.Value = 1;
    app.SinglecircuitButton.Value = 0;
end

%% Number of shield wires:

if strcmp(app.NumberofShieldWires.Value,'single')
   
    % None shield wires:
    app.NoneSW.Value = 0;
    % Single shield wires:
    app.SingleSW.Value = 1;
    % Doble shield wires:
    app.DoubleSW.value = 0;
    
elseif strcmp(app.NumberofShieldWires.Value,'double')
    
    % None shield wires:
    app.NoneSW.Value = 0;
    % Single shield wires:
    app.SingleSW.Value = 0;
    % Doble shield wires:
    app.DoubleSW.value = 1;
    
else % app.NumberofShieldWires.Value = none
   
    % None shield wires:
    app.NoneSW.Value = 1;
    % Single shield wires:
    app.SingleSW.Value = 0;
    % Doble shield wires:
    app.DoubleSW.value = 0;
end

%% Line model:

if strcmp(app.LineModel.Text,'pi')
    app.PiButton.Value = 1;
    app.BergeronButton.Value = 0;
elseif strcmp(app.LineModel.Text,'bergeron')
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
        attsetdata{j,2} = string(app.AttSet(thisattset).Phase(j).numberofCond.Value);
        attsetdata{j,3} = string(app.AttSet(thisattset).Phase(j).spaceBetweenCond.Value);
        attsetdata{j,4} = string(app.AttSet(thisattset).Phase(j).coordX.Value);
        attsetdata{j,5} = string(app.AttSet(thisattset).Phase(j).coordY.Value);
        attsetdata{j,6} = 'Phase'; % type
        attsetdata{j,7} = string(0);
        attsetdata{j,8} = string(0);
        attsetdata{j,9} = string(0);
    end
    
    if nsh > 0
        for j = 1: nsh
            attsetdata{j+nph,1} = app.AttSet(thisattset).ShieldWire(j).condID.Value;
            attsetdata{j+nph,2} = string(1); %one conductor per phase
            attsetdata{j+nph,3} = string(0); %one conductor per phase
            attsetdata{j+nph,4} = string(app.AttSet(thisattset).ShieldWire(j).coordX.Value);
            attsetdata{j+nph,5} = string(app.AttSet(thisattset).ShieldWire(j).coordY.Value);
            attsetdata{j+nph,6} = 'ShieldWire'; % type
            attsetdata{j+ nph,7} = string(0);
            attsetdata{j+ nph,8} = string(0);
            attsetdata{j+ nph,9} = string(0);
        end
    end
    
    if ntg > 0
        for j = 1 : ntg
            attsetdata{j+ nph + nsh,1} = app.AttSet(thisattset).Target(j).condID.Value;
            attsetdata{j+ nph + nsh,2} = string(1); %one conductor per phase
            attsetdata{j+ nph + nsh,3} = string(0); %one conductor per phase
            attsetdata{j+ nph + nsh,4} = string(app.AttSet(thisattset).Target(j).coordX.Value);
            attsetdata{j+ nph + nsh,5} = string(app.AttSet(thisattset).Target(j).coordY.Value);
            attsetdata{j+ nph + nsh,6} = 'Target'; % type
            attsetdata{j+ nph + nsh,7} = string(app.AttSet(thisattset).Target(j).CoatingResistivity.Value);
            attsetdata{j+ nph + nsh,8} = string(app.AttSet(thisattset).Target(j).CoatingThickness.Value);
            attsetdata{j+ nph + nsh,9} = string(app.AttSet(thisattset).Target(j).CoatingRelativePermeability.Value);
        end
    end
    
    structArray = cell2struct(attsetdata, {'conductor', 'bundled', 'bundle_spac','horizontal','vertical','type','coat_resistivity','coat_thickness','coat_relPermeability'},2);
    app.UITableAttSets.Data(thisattset)=cellstr(jsonencode(structArray));
end

%% Convert Soil Resistivity Table

app.UITableSoilRes.Data = num2cell(app.UITableSoilRes.Data);


%% Convert Geometry Coordinates File

target_coordinates_file= load(app.TargetCoordFile.Text);
source_coordinates_file=load(app.SourceCoordFile.Text);

app.SourceCoordX.Data = num2cell(source_coordinates_file(:,1));
app.SourceCoordY.Data = num2cell(source_coordinates_file(:,2));

app.TargetCoordX.Data = num2cell(target_coordinates_file(:,1));
app.TargetCoordY.Data = num2cell(target_coordinates_file(:,2));

%% Number of towers

app.NumTowers.Value = size(app.SourceCoordX.Data,1);

%% Air Permeability constant

app.AirPermeability.Value = 8.85e-12;

%% Faulted specify sections table convert:

Faulted_transf = cell2mat(struct2cell(app.FaultedSection));
Faulted_transf = struct2cell(Faulted_transf);

Faulted_Table(:,1) = Faulted_transf(:,1,:);
Faulted_Table(:,2) = Faulted_transf(:,2,:);

app.UITableFaultSec.Data = string(Faulted_Table);

%% Transposition Button convert

if strcmp(app.TranspositionScheme.Text,'untransposed')
    app.UntransposedButton.Value=1;
    app.L3L3L3Button.Value=0;
    app.L6L3L3L6Button.Value=0;
    
elseif strcmp(app.TranspositionScheme.Text,'L/3 L/3 L/3')
    app.UntransposedButton.Value=0;
    app.L3L3L3Button.Value=1;
    app.L6L3L3L6Button.Value=0;
    
else
    app.UntransposedButton.Value=0;
    app.L3L3L3Button.Value=0;
    app.L6L3L3L6Button.Value=1;
end

%% Type of Source

if strcmp(app.typeSource.Text,'current')
    app.typeSource.Value = 0;
else
    app.typeSource.Value = 1;
end

%% Type of Transient Study

if ~strcmp(app.TransientType.Text,'fault') % Nominal Load Conditions
    app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '0 - NONE';
end

%% Source time


