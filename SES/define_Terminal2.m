%% Terminal 2:

%Type of Terminal 2 Circuit 1: (source or load)
app.C1T2Type.Text = 'load';

%Type of Terminal 2 Circuit 2: (source or load)
app.C2T2Type.Text = 'source';

%% CIRCUIT 1 SOURCE DATA:

% RMS LL amplitude [V]:
app.RMSLLamplitudeC1T2.Value = 1000;

% Frequency [Hz]:
app.FrequencyC1T2.Value = 60;

% Phase angle [deg]:
app.PhaseangleC1T2.Value = 1.72;

%% CIRCUIT 1 LOAD DATA:

% Load connection: (Y or D)
app.LoadConnectionC1T2.Text = 'Y';

% If Delta Connection (AB)
app.LoadR1C1T2.Value = 1; %R1 [ohm]
app.LoadL1C1T2.Value = 0; %L1 [mH]
app.LoadC1C1T2.Value = 0; %C1 [uF]

% If Delta Connection (BC)
app.LoadR2C1T2.Value = 1; %R2 [ohm]
app.LoadL2C1T2.Value = 0; %L2 [mH]
app.LoadC2C1T2.Value = 0; %C2 [uF]

% If Delta Connection (CA)
app.LoadR3C1T2.Value = 1; %R3 [ohm]
app.LoadL3C1T2.Value = 0; %L3 [mH]
app.LoadC3C1T2.Value = 0; %C3 [uF]

%% CIRCUIT 1 THEVENIN EQ DATA:

% Thevenin Eq.:
% app.R0S1T2.Value = 0.4853; %R0 [ohm/m]
% app.L0S1T2.Value = 6.0779; %L0 [mH/m]
% app.R1S1T2.Value = 0.151; %R+ [ohm/m]
% app.L1S1T2.Value = 1.8828; %L+ [mH/m]
app.R0S1T2.Value = 1e-5; %R0 [ohm/m]
app.L0S1T2.Value = 0; %L0 [mH/m]
app.R1S1T2.Value = 1e-5; %R+ [ohm/m]
app.L1S1T2.Value = 0; %L+ [mH/m]


%% CIRCUIT 2 SOURCE DATA (IF EXIST):

% VOLTAGE SOURCE:
% RMS LL amplitude [V]:
app.RMSLLamplitudeC2T2.Value = 1000;

% Frequency [Hz]:
app.FrequencyC2T2.Value = 60;

% Phase angle [deg]:
app.PhaseangleC2T2.Value = 0;

%% CIRCUIT 2 LOAD DATA (IF EXIST):

% If is Load: (Y or D)
app.LoadConnectionC2T2.Text = 'Y';

% If Delta Connection (AB)
app.LoadR1C2T2.Value = 1e-5; %R1 [ohm]
app.LoadL1C2T2.Value = 0; %L1 [mH]
app.LoadC1C2T2.Value = 0; %C1 [uF]

% If Delta Connection (BC)
app.LoadR2C2T2.Value = 1e-5; %R2 [ohm]
app.LoadL2C2T2.Value = 0; %L2 [mH]
app.LoadC2C2T2.Value = 0; %C2 [uF]

% If Delta Connection (CA)
app.LoadR3C2T2.Value = 1e-5; %R3 [ohm]
app.LoadL3C2T2.Value = 0; %L3 [mH]
app.LoadC3C2T2.Value = 0; %C3 [uF]

%% TERMINAL 2 THEVENIN EQ. DATA (IF EXIST):

% Thevenin Eq.:
app.R0S2T2.Value = 0.4853; %R0 [ohm/m]
app.L0S2T2.Value = 6.0779; %L0 [mH/m]
app.R1S2T2.Value = 0.151; %R+ [ohm/m]
app.L1S2T2.Value = 1.8828; %L+ [mH/m]



%% TERMINAL 2 SE GROUND IMPEDANCES:
% Substation grounding grid:
app.RGG1T2.Value = 1; % R [ohms]
app.LGG1T2.Value = 0; % L [mH]
app.CGG1T2.Value = 0; % C [uF]

% Substation neutral connection:
app.RNC1T2.Value = 1e-5; % R [ohms]
app.LNC1T2.Value = 0; % L [mH]
app.CNC1T2.Value = 0; % C [uF]


