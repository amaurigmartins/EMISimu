% initialize the matlab workspace
clear; 
close all; 
clc;

%% Paths to executables

% ATP Solver path (%ATPPATH%\tools\runATP.exe):
app.ATPSolverPath.Text = 'C:\ATP\tools\runATP.exe';

% GTPPLOT path (%ATPPATH%\tools\GTPPL32.exe):
app.GTPPLOTPath.Text = 'C:\ATP\tools\GTPPL32.exe';

% PL42MAT path (%ATPPATH%\tools\Pl42mat.exe):
app.PL42MATPath.Text = [pwd '\util\Pl42mat.exe'];

%% Project data

% enter working directory:
app.Workingdirectory.Text = 'D:\Mestrado\EMISimu';

% enter the project directory name here
app.ProjectID.Text = 'TestSizeATP';

% Project description:
app.Projectdescription.Text = 'Simple interference case between a power line and a pipeline.';

%% Parallel Computing

% Enable (1 - Yes or 0 - No)
app.EnableParaCompCheckBox.Value = 0;

% Number of parallel works:
app.workersSpinner.Value = 10;

%% Process

addpath('functions');
addpath(getProjectID(app));

% define the problem
define_GeneralSettings;
define_Geometry;
define_LineParams;
define_FaultParams;
define_Terminal1;
define_Terminal2;
define_TargetParams;
define_AttSets;
define_Soil;
define_Outputs;
define_Benchmark;
define_EnergizationStudyParams;
define_CBSwitchingStudyParams;

% initialize program variables and initial calculations
initialize_Variables;
initialize_CouplingRegions;

% build LCC cards
makeAllLCCFiles(app);

% build main ATP card
makeAllMainATPFiles(app);


% run stuff
flist=dir(fullfile(getWorkingDirectory(app),getProjectID(app),'*.atp'));
if ~isempty(flist)
    disp('The ATP solver will be launched now. You may monitor progress from the MATLAB Command Window.');
    runAllCases(app,getProjectID(app),getWorkingDirectory(app),getATPsolverPath(app),getPL42MATPath(app),getFaultedSections(app),isParallelComputing(app),getNumParallelWorks(app));
    disp('All ATP cases ran!');
else
    error('No ATP files found in the working directory. First generate the circuit models and try again. You lose, fella.');
end

% Results
makeAllInducedVoltagePlots(app)
% fname=strcat(getProjectID(app),'_CBswitching_study','.mat');
% plotTLCurrent(fname,1,1,'Energization Circuit 1')

disp('All done!');

