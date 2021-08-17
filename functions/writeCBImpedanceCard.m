function out = writeCBImpedanceCard(app)

numCircuits = getNumCircuits(app);

out=[];
out1=[];
seq='ABCA';
CBImp = getCBImpedance(app);

for i = 1:numCircuits
    if isCBSwitchedCircuit(app,i)
        if strcmp(getCBConnecType(app,i),'Y')        
            for j = 1:3
                out1=blanks(80);
                out1(3:8)=sprintf('CB%d%s  ',i,seq(j));
                out1(9:15)=sprintf('CB%dGND ',i);
                out1(27:42)=modprin(16,CBImp(i,j,1));
                out1(43:58)=modprin(16,CBImp(i,j,2));
                out1(59:74)=modprin(16,CBImp(i,j,3));
                out1(80)='1';
                out = strcat(out,out1,'\n');
            end
            out2=blanks(80);
            out2(9:15)=sprintf('CB%dGND ',i);
            out2(27:42)=modprin(16,CBImp(i,4,1));
            out2(43:58)=modprin(16,CBImp(i,4,2));
            out2(59:74)=modprin(16,CBImp(i,4,3));
            out2(80)='1';
            out = strcat(out,out2,'\n');
        else % Delta Load Connection
            for j = 1:3
                out1=blanks(80);
                out1(3:8)=sprintf('CB%d%s  ',i,seq(j));
                out1(9:14)=sprintf('CB%d%s  ',i,seq(j+1));
                out1(27:42)=modprin(16,CBImp(i,j,1));
                out1(43:58)=modprin(16,CBImp(i,j,2));
                out1(59:74)=modprin(16,CBImp(i,j,3));
                out1(80)='1';
                out = strcat(out,out1,'\n');
            end
        end
    end
end

end