function out = writeCBPhaseVoltProbesCard(app)

out=[];
seq='ABC';

numCircuits = getNumCircuits(app);

for i=1:numCircuits
    if isCBSwitchedCircuit(app,i)
        tmp_out=blanks(80);
        tmp_out(3:8)=sprintf('CB%d%s  ',i,seq(1));
        tmp_out(9:14)=sprintf('CB%d%s  ',i,seq(2));
        tmp_out(15:20)=sprintf('CB%d%s  ',i,seq(3));
        out=strcat(out,tmp_out,'\n');
    end
end

end