%% Terminal 1:

%% CIRCUIT 1 DATA:

% RMS LL amplitude [V]:
app.RMSLLamplitudeC1T1.Value = 1000;

% Frequency [Hz]:
app.FrequencyC1T1.Value = 60;

% Phase angle [deg]:
app.PhaseangleC1T1.Value = 0;

% Tstart [s]:
app.TstartsC1T1.Value = -1;

% Tstop [s]:
app.TstopsC1T1.Value = 100;

% Thevenin Eq.:
app.R0S1T1.Value = 0.4853; %R0 [ohm/m]
app.L0S1T1.Value = 6.0779; %L0 [mH/m]
app.R1S1T1.Value = 0.151; %R+ [ohm/m]
app.L1S1T1.Value = 1.8828; %L+ [mH/m]


%% CIRCUIT 2 DATA (IF EXIST):

% RMS LL amplitude [V]:
app.RMSLLamplitudeC2T1.Value = 1000;

% Frequency [Hz]:
app.FrequencyC2T1.Value = 60;

% Phase angle [deg]:
app.PhaseangleC2T1.Value = 0;

% Tstart [s]:
app.TstartsC2T1.Value = -1;

% Tstop [s]:
app.TstopsC2T1.Value = 100;

% Thevenin Eq.:
app.R0S2T1.Value = 0.4853; %R0 [ohm/m]
app.L0S2T1.Value = 6.0779; %L0 [mH/m]
app.R1S2T1.Value = 0.151; %R+ [ohm/m]
app.L1S2T1.Value = 1.8828; %L+ [mH/m]

%% TERMINAL 1 SE IMPEDANCES:

% Substation grounding grid:
app.RGG1T1.Value = 1e-5; % R [ohms]
app.LGG1T1.Value = 0; % L [mH]
app.CGG1T1.Value = 0; % C [uF]

% Substation neutral connection:
app.RNC1T1.Value = 1e-5; % R [ohms]
app.LNC1T1.Value = 0; % L [mH]
app.CNC1T1.Value = 0; % C [uF]






