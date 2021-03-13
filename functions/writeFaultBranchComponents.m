function out = writeFaultBranchComponents(app)

out1=blanks(80);
out2=blanks(80);
out3=blanks(80);
out4=blanks(80);
out5=blanks(80);
out6=blanks(80);

[RG, RF] = getFaultResistances(app);

out1(3:6)='RG_C';
out1(9:14)='FGOUTC';
out1(27:42)=modprin(app,16,RG);
out1(80)='0';

out2(3:6)='RG_A';
out2(9:14)='FGOUTA';
out2(27:42)=modprin(app,16,RG);
out2(80)='0';

out3(3:5)='RFB';
out3(9:11)='RFA';
out3(27:42)=modprin(app,16,RF);
out3(80)='0';

out4(3:5)='RFC';
out4(9:11)='RFB';
out4(27:42)=modprin(app,16,RF);
out4(80)='0';

out5(3:5)='RFC';
out5(9:11)='RFA';
out5(27:42)=modprin(app,16,RF);
out5(80)='0';

out6(3:6)='RG_B';
out6(9:14)='FGOUTB';
out6(27:42)=modprin(app,16,RG);
out6(80)='0';

 
out=strcat(out1,'\n',out2,'\n',out3,'\n',out4,'\n',out5,'\n',out6,'\n');

end