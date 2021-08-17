%% CAPACITOR BANK SWITCHING PARAMS

% Switched circuit:('Circuit 1, Circuit 2 or Both')
app.CBSwitchedCircuit.Text = 'Circuit 1';

%% CIRCUIT 1 CB

% Type of capacitor bank connection(Y or D):
app.CBConnectionC1.Text = 'Y';

% Location (Tower Number)
app.CBTowerC1.Value = 1;

% Capacitor bank impedances:
% If Delta Connection (AB)
app.CBImpedanceR1C1.Value = 1; %R1 [ohm]
app.CBImpedanceL1C1.Value = 0; %L1 [mH]
app.CBImpedanceC1C1.Value = 0; %C1 [uF]

% If Delta Connection (BC)
app.CBImpedanceR2C1.Value = 1; %R2 [ohm]
app.CBImpedanceL2C1.Value = 0; %L2 [mH]
app.CBImpedanceC2C1.Value = 0; %C2 [uF]

% If Delta Connection (CA)
app.CBImpedanceR3C1.Value = 1; %R3 [ohm]
app.CBImpedanceL3C1.Value = 0; %L3 [mH]
app.CBImpedanceC3C1.Value = 0; %C3 [uF]

% Grounding impedance
app.CBGroundImpedanceRC1.Value = 1e-5; %R1 [ohm]
app.CBGroundImpedanceLC1.Value = 0; %L1 [mH]
app.CBGroundImpedanceCC1.Value = 0; %C1 [uF]

% Circuit CB time switch:
app.CBSWTimeC1A.Value = 10e-3; %[s]
app.CBSWTimeC1B.Value = 10e-3; %[s]
app.CBSWTimeC1C.Value = 10e-3; %[s]


%% CIRCUIT 2 CB IMPEDANCES

% Type of capacitor bank connection(Y or D):
app.CBConnectionC2.Text = 'Y';

% Location (Tower Number)
app.CBTowerC2.Value = 1;

% Capacitor bank impedances:
% If Delta Connection (AB)
app.CBImpedanceR1C2.Value = 1; %R1 [ohm]
app.CBImpedanceL1C2.Value = 0; %L1 [mH]
app.CBImpedanceC1C2.Value = 0; %C1 [uF]

% If Delta Connection (BC)
app.CBImpedanceR2C2.Value = 1; %R2 [ohm]
app.CBImpedanceL2C2.Value = 0; %L2 [mH]
app.CBImpedanceC2C2.Value = 0; %C2 [uF]

% If Delta Connection (CA)
app.CBImpedanceR3C2.Value = 1; %R3 [ohm]
app.CBImpedanceL3C2.Value = 0; %L3 [mH]
app.CBImpedanceC3C2.Value = 0; %C3 [uF]

% Grounding impedance
app.CBGroundImpedanceRC2.Value = 1e-5; %R1 [ohm]
app.CBGroundImpedanceLC2.Value = 0; %L1 [mH]
app.CBGroundImpedanceCC2.Value = 0; %C1 [uF]

% Circuit CB start time switch:
app.CBSWTimeC2A.Value = 10e-3; %[s]
app.CBSWTimeC2B.Value = 10e-3; %[s]
app.CBSWTimeC2C.Value = 10e-3; %[s]



