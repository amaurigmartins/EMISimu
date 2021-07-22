%% NOMINAL LOAD INDUCED VOLTAGE BENCHMARK

% Benchmark file:
app.Benchmark.Target(1).NLInducedVoltageFile.Text = 'resp_SES_H.txt';

% Benchmark Program (SESTLC or ROW)
app.Benchmark.Target(1).NLInducedVoltageProgram.Text = 'SESTLC';


%% FAULTED INDUCED VOLTAGE BENCHMARK

% Fault at Tower 1:
app.Benchmark.Target(1).InducedVoltageFile(1).Text = 'resp_SES_H.txt'; % Benchmark file:
app.Benchmark.Target(1).InducedVoltageProgram(1).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)

% Fault at Tower 2:
app.Benchmark.Target(1).InducedVoltageFile(2).Text = 'resp_SES_H.txt'; % Benchmark file:
app.Benchmark.Target(1).InducedVoltageProgram(2).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)