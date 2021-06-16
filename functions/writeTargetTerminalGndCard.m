function out = writeTargetTerminalGndCard(app,RLC,ntg)

term1 = 0;
term2 = getNumSections(app);

seq_target = 'ABCDEFGHIJKLMNOPQRSTUWVXYZ';

out1=blanks(80);
out1(9:13)=sprintf('%s%04d',seq_target(ntg),term1);
out1(27:42)=modprin(16,RLC(1,1));
% out1(43:58)=modprin(app,16,RLC(2));
% out1(59:74)=modprin(16,C);
out1(80)=sprintf('%d',3);
out1=strcat(out1,'\n');

out2=blanks(80);
out2(9:13)=sprintf('%s%04d',seq_target(ntg),term2);
out2(27:42)=modprin(16,RLC(1,2));
% out1(43:58)=modprin(app,16,RLC(2));
% out2(59:74)=modprin(16,C);
out2(80)=sprintf('%d',3);
out2=strcat(out2,'\n');

out=strcat(out1,out2);

end