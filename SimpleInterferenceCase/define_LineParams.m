
% Number of circuits (single or double):
app.LineConfig.Text = 'single';

%% Ground impedances

app.GroundImpedanceFile.Text = 'D:\Mestrado\EMISimu\SimpleInterferenceCase\ground_impedance_data.csv';

% Ground impedances data (.csv) per section (R L C) [Ohms mH uF]:
app.UITableGroundImp.Data = load(app.GroundImpedanceFile.Text);

%% Shield wires

% Number of shield wires (none, single or double):
app.NumberofShieldWires.Value = 'single';

%% Line model

% Types: pi, bergeron and jmarti
app.LineModel.Text = 'jmarti';

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




