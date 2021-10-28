%% NOMINAL LOAD INDUCED VOLTAGE BENCHMARK

% Benchmark file:
app.Target(1).Benchmark.NLInducedVoltageFile.Text = [];

% Benchmark Program (SESTLC or ROW)
app.Target(1).Benchmark.NLInducedVoltageProgram.Text = 'ROW';
% % Benchmark file:
% app.Target(1).Benchmark.NLInducedVoltageFile.Text = [];
% 
% % Benchmark Program (SESTLC or ROW)
% app.Target(1).Benchmark.NLInducedVoltageProgram.Text = [];
% 

%% FAULTED INDUCED VOLTAGE BENCHMARK

% Fault at Tower 1:
app.Target(1).Benchmark.InducedVoltageFile(3).Text = []; % Benchmark file:
app.Target(1).Benchmark.InducedVoltageProgram(3).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)

% Fault at Tower 2:
app.Target(1).Benchmark.InducedVoltageFile(4).Text = []; % Benchmark file:
app.Target(1).Benchmark.InducedVoltageProgram(4).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)


%% ENERGIZATION INDUCED VOLTAGE BENCHMARK

% Benchmark file:
app.Target(1).Benchmark.EnergizationInducedVoltageFile.Text = []';

% Benchmark Program (SESTLC or ROW)
app.Target(1).Benchmark.EnergizationInducedVoltageProgram.Text = [];

%% CB SWITCHING INDUCED VOLTAGE BENCHMARK

% Benchmark file:
app.Target(1).Benchmark.CBSwithingInducedVoltageFile.Text = []';

% Benchmark Program (SESTLC or ROW)
app.Target(1).Benchmark.CBSwithingInducedVoltageProgram.Text = [];

