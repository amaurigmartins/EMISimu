

%% Tower-to-ground outputs

% Tower-to-ground voltages (Yes = 1 or No = 0):
app.Towertogroundvoltages.Value = 1;

% Tower-to-ground currents (Yes = 1 or No = 0):
app.Towertogroundcurrents.Value = 1;

% Specify sections to Tower-to-ground outputs:
Tow2Ground(1).from = 1;
Tow2Ground(1).to = 3;
Tow2Ground(2).from = 5;
Tow2Ground(2).to = 6;
Tow2Ground(3).from = 7;
Tow2Ground(3).to = 7;

% Or sections before and after fault:

% Yes -> 1 or No -> 0
app.OrsectionsbeforeandafterfaultTowShuntParam.Value = 0;

% If "Yes" is selected, how many towers before and after fault:
app.Tow2Ground.Value = 10;