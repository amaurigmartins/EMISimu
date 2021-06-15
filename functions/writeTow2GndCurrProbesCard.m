function out = writeTow2GndCurrProbesCard(app,sec)

out=blanks(80);
out(3:8)=sprintf('0%05d',sec);
out(55:63)='MEASURING';
out(80)='1';
out=strcat(out,'\n');


end