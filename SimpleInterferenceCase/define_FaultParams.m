
% Faulted circuit: (Circuit 1 or Circuit 2)
app.Faultedcircuit.Value = 1;

% Number of fault's section:
app.fault_sec = 1;

% Fault incidence angle [degress]:
app.Faultincidenceangle.Value = 90;

% Fault Type:
% Types: 1 - AG, 2 - BG, 3 - CG, 4 - AB, 5 - BC, 
% 6 - CA, 7 - ABG, 8 - BCG, 9 - CAG, 10 - ABC, 11 - ABCG.
app.FaulttypeFTYPEButtonGroup.Value = 1;

% Frequency [Hz]:
app.Freq.Value = 60;

% Cycles before fault:
app.Cyclesbeforefault.Value = 0.5;

% Phase-to-phase resistance [Ohms]:
app.Phasetophaseresistance.Value = 1e12;

% Phase-to-ground resistance [Ohms]:
app.Phasetogroundresistance.Value = 1e-5;