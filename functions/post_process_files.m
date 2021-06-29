clear all;
close all;
clc;

dt=1.5e-7;
tw=1/60/dt;

for k=1:443
fname=sprintf('real500line_fault_sec%d.mat',k);
varname=sprintf('i%05dTerra',k);
load(fname,varname,'t');
fprintf('Processing file %d...\n',k);
phasordata=sineFit(t(end-2*tw:end),eval(sprintf('%s(end-2*tw:end)',varname)));
iF(k,:)=phasordata(2);
end

bar([1:443],iF)