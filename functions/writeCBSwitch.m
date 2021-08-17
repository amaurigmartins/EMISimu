function out = writeCBSwitch(app)

numCircuits = getNumCircuits(app);

TimeCBSW = getCBSwitchTime(app);

seq='ABCA';

out = [];

for i =1:numCircuits
     if isCBSwitchedCircuit(app,i)
        CBsection = TowNum2LCC(app,getCBTower(app,i));
        tmp_out=blanks(80);
        for j=1:3
            tmp_out(3:8)=sprintf('%d%04d%s',i,CBsection,seq(j));
            tmp_out(9:15)=sprintf('CB%d%s   ',i,seq(j));
            tmp_out(15:24)=modprin(10,TimeCBSW(i,j));
            tmp_out(25:34)='      1.E3';
            tmp_out(80)='1';
            out=strcat(out,tmp_out,'\n');
        end
     end
end

end

