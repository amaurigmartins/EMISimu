%% DEFINE SIMULATIONS SETTINGS

% dT 
app.deltaT.Value = 1e-7;

% Tmax simulation [s]
app.Tmax.Value = 0.1;


%% DEFINE TYPE OF STUDY

% (nominal load, fault, energization, CB switching)
app.TransientType.Text = 'nominal load';

% Source type:
% Current or Voltage Source?
app.SourceType.Text = 'current'; 


%% DEFINE GENERAL CONSTANTS

DEFAULT_SOURCE_START = -1; % [s]
DEFAULT_SOURCE_STOP = 100; %[s]
% dT 
app.deltaT.Value = 1e-7;

% Tmax simulation [s]
app.Tmax.Value = 0.1;