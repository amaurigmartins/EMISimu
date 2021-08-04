
% Number of circuits (single or double):
app.LineConfig.Text = 'single';

%% Transposition

% Type of transposition (untransposed, L/3 L/3 L/3 OR L/6 L/3 L/3 L/6)
app.TranspositionScheme.Text = 'untransposed';

%% Ground impedances

% Ground impedances data (.csv) per section (R L C) [Ohms mH uF]:
app.GroundImpedanceFile.Text = 'D:\Mestrado\EMISimu\SES\ground_impedance_data.csv';

%% Shield wires

% Number of shield wires (none, single or double):
app.NumberofShieldWires.Value = 'single';

%% Line model

% Types: pi, bergeron and jmarti
app.LineModel.Text = 'pi';

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




