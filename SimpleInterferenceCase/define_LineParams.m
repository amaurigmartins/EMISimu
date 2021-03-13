
% Number of circuits (1 or 2):
app.NumCircuits.Value = 1;


% Number of sections:
app.Numberofsections.Value = 50;
%%% CUIDADO COM ISSO AQUI. O N�MERO DE SE��ES SER� CALCULADO A PARTIR DO
%%% CSV COM COORDENADAS DAS TORRES E N�O DEFINIDO MANUALMENTE

%% Thevenin params:

% First circuit:
app.R0S1T1.Value = 0.4853; %R0 [ohm/m]
app.L0S1T1.Value = 6.0779; %L0 [mH/m]
app.R1S1T1.Value = 0.151; %R+ [ohm/m]
app.L1S1T1.Value = 1.8828; %L+ [mH/m]

app.R0S1T2.Value = 0.4853; %R0 [ohm/m]
app.L0S1T2.Value = 6.0779; %L0 [mH/m]
app.R1S1T2.Value = 0.151; %R+ [ohm/m]
app.L1S1T2.Value = 1.8828; %L+ [mH/m]


% Second circuit:
app.R0S2T1.Value = 0.4853; %R0 [ohm/m]
app.L0S2T1.Value = 6.0779; %L0 [mH/m]
app.R1S2T1.Value = 0.151; %R+ [ohm/m]
app.L1S2T1.Value = 1.8828; %L+ [mH/m]

app.R0S2T2.Value = 0.4853; %R0 [ohm/m]
app.L0S2T2.Value = 6.0779; %L0 [mH/m]
app.R1S2T2.Value = 0.151; %R+ [ohm/m]
app.L1S2T2.Value = 1.8828; %L+ [mH/m]

%% Ground impedances

% Ground impedances data (.csv) per section (R L C) [Ohms mH uF]:
app.UITableGroundImp.Data = load('ground_impedance_data.csv');

%% Shield wires

% None shield wires:
app.NoneSW.Value = 0;

% Single shield wires:
app.SingleSW.Value = 1;

% Doble shield wires:
app.DoubleSW.value = 0;




