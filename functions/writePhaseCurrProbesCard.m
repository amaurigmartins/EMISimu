function out = writePhaseCurrProbesCard(app,thisterm)

out=[];
seq='ABC';
ncirc=valIfTrue(app,app.Doublecircuit.Value==1,2,1);


if thisterm==1
    termIdx=0;
elseif thisterm==2
    termIdx=app.Numberofsections.Value;
end

for i=1:ncirc
    tmp_out=blanks(80);
    for j=1:3
        tmp_out(3:8)=sprintf('TH%dT%d%s',i,thisterm,seq(j));
        tmp_out(9:14)=sprintf('%d%04d%s',i,termIdx,seq(j));
        tmp_out(55:63)='MEASURING';
        tmp_out(80)='1';
        out=strcat(out,tmp_out,'\n');
    end
end

end