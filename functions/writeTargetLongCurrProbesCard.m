function out = writeTargetLongCurrProbesCard(app,ntg,sec)

seq_target = 'ABCDEFGHIJKLMNOPQRSTUWVXYZ';

out=blanks(80);
out(3:8)=sprintf('%s%04dM',seq_target(ntg),sec);
out(9:14)=sprintf('%s%04d ',seq_target(ntg),sec);
out(55:63)='MEASURING';
out(80)='1';
out=strcat(out,'\n');

end