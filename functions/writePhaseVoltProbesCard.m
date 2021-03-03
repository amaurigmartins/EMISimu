function out = writePhaseVoltProbesCard(app,thisterm)

out=[];
seq='ABC';
ncirc=valIfTrue(app,app.DoublecircuitButton.Value==1,2,1);

for i=1:ncirc
    tmp_out=blanks(80);
    tmp_out(3:8)=sprintf('TH%dT%d%s',i,thisterm,seq(1));
    tmp_out(9:14)=sprintf('TH%dT%d%s',i,thisterm,seq(2));
    tmp_out(15:20)=sprintf('TH%dT%d%s',i,thisterm,seq(3));
    out=strcat(out,tmp_out,'\n');
end

end