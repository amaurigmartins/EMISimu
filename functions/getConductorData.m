function [Rout, Rin, Rdc, TD] = getConductorData(condID)
load('condudb.mat');

idx = find(contains(condudb_data(:,1),condID));

Rout=100*cell2mat(condudb_data(idx,2)); %radius in centimeters
Rin=100*cell2mat(condudb_data(idx,3)); %radius in centimeters
Rdc=cell2mat(condudb_data(idx,4));
TD=(Rout-Rin)/(2*Rout);
end