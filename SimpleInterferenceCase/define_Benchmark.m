%% NOMINAL LOAD INDUCED VOLTAGE BENCHMARK

% Benchmark file:
app.Target(1).Benchmark.NLInducedVoltageFile.Text = 'Result_CDEGS.csv';

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
app.Target(1).Benchmark.InducedVoltageFile(1).Text = 'resp_SES_H.txt'; % Benchmark file:
app.Target(1).Benchmark.InducedVoltageProgram(1).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)

% Fault at Tower 2:
app.Target(1).Benchmark.InducedVoltageFile(2).Text = 'resp_SES_H.txt'; % Benchmark file:
app.Target(1).Benchmark.InducedVoltageProgram(2).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)