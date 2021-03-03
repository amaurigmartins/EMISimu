function [out] = writeJMartiFreqCard(app,sec)
out1=blanks(80);out2=blanks(80);out3=blanks(80);
rho=getSoilRes(app,sec);
lineparams=getLineModelParams(app);
f=lineparams.frequency;
dec=lineparams.decades;
pdec=lineparams.points_per_decade;
fmat=lineparams.freq_matrix;
fss=lineparams.freq_ss;
L=getSpanLen(app,sec)/1000;
%         1         2         3         4         5         6         7         8
%12345678901234567890123456789012345678901234567890123456789012345678901234567890
%RHO    >FMATRIX  >          >ICPRN> IZPRN>I>ALONG  > IPI>IM          MOIF
%    100.     2500.                                1.                 1-9
%    100.       60.                                1.                 1-9

out1(1:8)=modprin(app,8,rho);
out1(9:18)=modprin(app,10,fmat);
out1(45:52)=modprin(app,8,L);
out1(70:72)='1-9';

out2(1:8)=modprin(app,8,rho);
out2(9:18)=modprin(app,10,fss);
out2(45:52)=modprin(app,8,L);
out2(70:72)='1-9';

%         1         2         3         4         5         6         7         8
%12345678901234567890123456789012345678901234567890123456789012345678901234567890
%    100.       60.                                1.         6 10    1-9
out3(1:8)=modprin(app,8,rho);
out3(9:18)=modprin(app,10,f);
out3(45:52)=modprin(app,8,L);
out3(61:62)=sprintf('%2d',dec);
out3(64:65)=sprintf('%2d',pdec);
out3(70:72)='1-9';

out=strcat(out1,'\n',out2,'\n',out3,'\n');

out=strcat(out,'BLANK CARD ENDING FREQUENCY CARDS\n');
out=strcat(out,'BLANK CARD ENDING LINE CONSTANT\n');
out=strcat(out,'DEFAULT\n');
out=strcat(out,'$PUNCH\n');
out=strcat(out,'BLANK CARD ENDING JMARTI SETUP');

end