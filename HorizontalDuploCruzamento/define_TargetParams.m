%% Number of targets:

app.NumTargets.Value = 1;

% Minimum target length subdivision in [m]:

app.MinTargetLength.Value = 50;

%% TERMINAL 1 TARGET IMPEDANCES:

% Terminal grounding impedance:
app.Target(1).GroundImpedanceT1.Value = 10; % R [ohms]


%% TERMINAL 2 TARGET IMPEDANCES:

% Terminal grounding impedance:
app.Target(1).GroundImpedanceT2.Value = 10; % R [ohms]


%% TARGET DISPLAY NAME

app.Target(1).DisplayName.Text = 'Horizontal Cruzamento Duplo 90 graus';