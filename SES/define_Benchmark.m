%% NOMINAL LOAD INDUCED VOLTAGE BENCHMARK

% Benchmark file:
app.Benchmark.NLInducedVoltageFile.Text = 'resp_SES_H.txt';

% Benchmark Program (SESTLC or ROW)
app.Benchmark.NLInducedVoltageProgram.Text = 'SESTLC';


%% FAULTED INDUCED VOLTAGE BENCHMARK

% Fault at Tower 1:
app.Benchmark.InducedVoltageFile(1).Text = 'resp_SES_H.txt'; % Benchmark file:
app.Benchmark.NLInducedVoltageProgram(1).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)

% Fault at Tower 2:
app.Benchmark.InducedVoltageFile(2).Text = 'resp_SES_H.txt'; % Benchmark file:
app.Benchmark.NLInducedVoltageProgram(2).Text = 'SESTLC'; % Benchmark Program (SESTLC or ROW)