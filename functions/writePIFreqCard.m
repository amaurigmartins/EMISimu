function [out] = writePIFreqCard(app,sec,L)

out=blanks(80);
rho=getSoilRes(app,LCC2TowNum(app,sec));
lineparams=getLineModelParams(app);
f=lineparams.frequency;
% L=getSpanLen(app,sec)/1000;
%         1         2         3         4         5         6         7         8
%12345678901234567890123456789012345678901234567890123456789012345678901234567890
%RHO    >FMATRIX  >          >ICPRN> IZPRN>I>ALONG  > IPI>IM          MOIF
%    100.       60.                         1      1.     0        44
out(1:8)=modprin(8,rho);
out(9:18)=modprin(10,f);
out(44)=sprintf('%d',1);
out(45:52)=modprin(8,L);
out(67:68)=sprintf('%d',44);

out=strcat(out,'\n','$PUNCH\n');
out=strcat(out,'BLANK CARD ENDING FREQUENCY CARDS\n');
out=strcat(out,'BLANK CARD ENDING LINE CONSTANT');
end