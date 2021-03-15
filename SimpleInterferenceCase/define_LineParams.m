
% Number of circuits (1 or 2):
app.NumCircuits.Value = 1;


% Number of sections:
app.Numberofsections.Value = 50;
%%% CUIDADO COM ISSO AQUI. O NÚMERO DE SEÇÕES SERÁ CALCULADO A PARTIR DO
%%% CSV COM COORDENADAS DAS TORRES E NÃO DEFINIDO MANUALMENTE

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




