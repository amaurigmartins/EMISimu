% initialize the matlab workspace
clear; 
close all; 
clc;

%% Paths to executables

% ATP Solver path (%ATPPATH%\tools\runATP.exe):
app.ATPSolverPath.Value = 'C:\ATP\tools\runATP.exe';

% GTPPLOT path (%ATPPATH%\tools\GTPPL32.exe):
app.GTPPLOTPath.Value = 'C:\ATP\tools\GTPPL32.exe';

% PL42MAT path (%ATPPATH%\tools\Pl42mat.exe):
app.PL42MATPath.Value = 'C:\ATP\tools\Pl42mat.exe';

%% Project data

% enter working directory:
app.Workingdirectory.Value = 'D:\Mestrado\EMISimu';

% enter the project directory name here
app.ProjectID.Value = 'SimpleInterferenceCase';

% Project description:
app.Projectdescription.Value = 'Simple interference case between a power line and a pipeline.';

%% Process

addpath(app.ProjectID.Value);
addpath('functions');

% define the problem
define_ATPSettings;
define_Geometry;
define_LineParams;
define_FaultParams;
define_Terminal1;
define_Terminal2;
define_TargetParams;
define_AttSets;
define_Soil;
define_Outputs;

% initialize program variables and initial calculations
initialize_Variables;
initialize_CouplingRegions;

% build LCC cards

% build main ATP card

% run stuff

% Results 2