

%% Tower-to-ground outputs

% Tower-to-ground voltages (Yes = 1 or No = 0):
app.Towertogroundvoltages.Value = 1;

% Tower-to-ground currents (Yes = 1 or No = 0):
app.Towertogroundcurrents.Value = 1;

% Specify sections to Tower-to-ground outputs:
app.Tow2Ground(1).From.Value = 1;
app.Tow2Ground(1).To.Value = 3;
app.Tow2Ground(2).From.Value = 5;
app.Tow2Ground(2).To.Value = 6;
app.Tow2Ground(3).From.Value = 7;
app.Tow2Ground(3).To.Value = 7;

% Or sections before and after fault:

% Yes -> 1 or No -> 0
app.OrsectionsbeforeandafterfaultTowShuntParam.Value = 0;

% If "Yes" is selected, how many towers before and after fault:
app.Tow2Ground.Value = 10;