% initialize the matlab workspace
clear; 
close all; 
clc;

% enter the project directory name here
app.ProjectID.Value = 'SimpleInterferenceCase';

% Project description:
app.Projectdescription.Value = 'Simple interference case between a power line and a pipeline.';

addpath(project_name);
addpath('functions');

% define the problem
define_ATPSettings;
define_FaultParams;
define_LineParams;

% build LCC cards

% build main ATP card

% run stuff

% Results 2