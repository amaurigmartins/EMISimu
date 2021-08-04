%% Terminal 2:

%% CIRCUIT 1 DATA:

% RMS LL amplitude [V]:
app.RMSLLamplitudeC1T2.Value = 88000;

% Frequency [Hz]:
app.FrequencyC1T2.Value = 60;

% Phase angle [deg]:
app.PhaseangleC1T2.Value = 1.72;

% Tstart [s]:
app.TstartsC1T2.Value = -1;

% Tstop [s]:
app.TstopsC1T2.Value = 100;

% Thevenin Eq.:
% app.R0S1T2.Value = 0.4853; %R0 [ohm/m]
% app.L0S1T2.Value = 6.0779; %L0 [mH/m]
% app.R1S1T2.Value = 0.151; %R+ [ohm/m]
% app.L1S1T2.Value = 1.8828; %L+ [mH/m]
app.R0S1T2.Value = 1e-5; %R0 [ohm/m]
app.L0S1T2.Value = 0; %L0 [mH/m]
app.R1S1T2.Value = 1e-5; %R+ [ohm/m]
app.L1S1T2.Value = 0; %L+ [mH/m]

%% CIRCUIT 2 DATA (IF EXIST):

% VOLTAGE SOURCE:
% RMS LL amplitude [V]:
app.RMSLLamplitudeC2T2.Value = 1000;

% Frequency [Hz]:
app.FrequencyC2T2.Value = 60;

% Phase angle [deg]:
app.PhaseangleC2T2.Value = 0;

% Tstart [s]:
app.TstartsC2T2.Value = -1;

% Tstop [s]:
app.TstopsC2T2.Value = 100;

% Thevenin Eq.:
app.R0S2T2.Value = 0.4853; %R0 [ohm/m]
app.L0S2T2.Value = 6.0779; %L0 [mH/m]
app.R1S2T2.Value = 0.151; %R+ [ohm/m]
app.L1S2T2.Value = 1.8828; %L+ [mH/m]

%% TERMINAL 2 SE IMPEDANCES:
% Substation grounding grid:
app.RGG1T2.Value = 1; % R [ohms]
app.LGG1T2.Value = 0; % L [mH]
app.CGG1T2.Value = 0; % C [uF]

% Substation neutral connection:
app.RNC1T2.Value = 1e-5; % R [ohms]
app.LNC1T2.Value = 0; % L [mH]
app.CNC1T2.Value = 0; % C [uF]


