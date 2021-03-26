
% Number of circuits (1 or 2):
app.NumberofCircuits.Value = 1;

% Number of sections:
app.Numberofsections.Value = 50;
%%% CUIDADO COM ISSO AQUI. O NÚMERO DE SEÇÕES SERÁ CALCULADO A PARTIR DO
%%% CSV COM COORDENADAS DAS TORRES E NÃO DEFINIDO MANUALMENTE

%% Ground impedances

% Ground impedances data (.csv) per section (R L C) [Ohms mH uF]:
app.UITableGroundImp.Data = load('ground_impedance_data.csv');

%% Shield wires

% Number of shield wires (0, 1 or 2):
app.NumberofShieldWires.Value = 1;

%% Line model

% Types: pi, bergeron and jmarti
app.LineModel = 'jmarti';

% LCC frequency
app.LCCfrequency.Value = 60;

%% IF Line Model is JMarti:

% Decades:
app.Decades.Value = 1;

% Points/Decade:
app.PointsDecade.Value = 10;

% Freq. Matrix [Hz]:
app.Freqmatrix.Value = 60;

% Freq. SS [Hz]:
app.FreqSS.Value = 1e6;




