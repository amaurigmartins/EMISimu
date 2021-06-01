
% Faulted circuit: (Circuit 1 or Circuit 2)
app.Faultedcircuit.SelectedObject.Text = 'Circuit 1';

% Number of fault's section:
app.FaultedSection(1).From.Value = 1;
app.FaultedSection(1).To.Value = 3;


% Fault incidence angle [degress]:
app.Faultincidenceangle.Value = 90;

% Fault Type:
% Types: 1 - AG, 2 - BG, 3 - CG, 4 - AB, 5 - BC, 
% 6 - CA, 7 - ABG, 8 - BCG, 9 - CAG, 10 - ABC, 11 - ABCG.
app.FaulttypeFTYPEButtonGroup.SelectedObject.Text = '1 - AG';

% Frequency [Hz]:
app.Freq.Value = 60;

% Cycles before fault:
app.Cyclesbeforefault.Value = 0.5;

% Phase-to-phase resistance [Ohms]:
app.Phasetophaseresistance.Value = 1e5;

% Phase-to-ground resistance [Ohms]:
app.Phasetogroundresistance.Value = 1e-5;


