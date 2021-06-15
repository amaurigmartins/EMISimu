function out = writeFaultBranchVoltProbesCard(app)

out=[];
seq='ABC';

out=blanks(80);
out(3:7)=sprintf('F_IN%s',seq(1));
out(9:13)=sprintf('F_IN%s',seq(2));
out(15:19)=sprintf('F_IN%s',seq(3));
out=strcat(out,'\n');

end