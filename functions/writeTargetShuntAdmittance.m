function out = writeTargetShuntAdmittance(app,ntg,sec)

[R,C] = calcShuntAdmittance(app,ntg,sec);


out1=blanks(80);
out1(9:14)=sprintf('T%d%04d',ntg,sec-1);
out1(27:42)=modprin(16,R);
% out1(43:58)=modprin(app,16,RLC(2));
out1(59:74)=modprin(16,C);
out1(80)=sprintf('%d',3);
out1=strcat(out1,'\n');

out2=blanks(80);
out2(9:14)=sprintf('T%d%04d',ntg,sec);
out2(27:42)=modprin(16,R);
% out1(43:58)=modprin(app,16,RLC(2));
out2(59:74)=modprin(16,C);
out2(80)=sprintf('%d',0);
out2=strcat(out2,'\n');

out=strcat(out1,out2);

end