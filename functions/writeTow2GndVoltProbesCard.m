function out = writeTow2GndVoltProbesCard(app,sec)

out=blanks(80);
out(3:8)=sprintf('0%05d',sec);
out=strcat(out,'\n');

end