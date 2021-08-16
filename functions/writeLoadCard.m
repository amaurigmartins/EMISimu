function out = writeLoadCard(app)

numCircuits = getNumCircuits(app);

out=[];
out1=[];
seq='ABCA';
LoadImp = getLoadImpedance(app);

for i = 1:numCircuits
    if isT2Load(app,i)
        if strcmp(getLoadConnecType(app,i),'Y')        
            for j = 1:3
                out1=blanks(80);
                out1(3:8)=sprintf('LD%dT%d%s',i,2,seq(j)); 
                out1(27:42)=modprin(16,LoadImp(i,j,1));
                out1(43:58)=modprin(16,LoadImp(i,j,2));
                out1(59:74)=modprin(16,LoadImp(i,j,3));
                out1(80)='3';
                out = strcat(out,out1,'\n');
            end
        else % Delta Load Connection
            for j = 1:3
                out1=blanks(80);
                out1(3:8)=sprintf('LD%dT%d%s',i,2,seq(j));
                out1(9:14)=sprintf('LD%dT%d%s',i,2,seq(j+1));
                out1(27:42)=modprin(16,LoadImp(i,j,1));
                out1(43:58)=modprin(16,LoadImp(i,j,2));
                out1(59:74)=modprin(16,LoadImp(i,j,3));
                out1(80)='3';
                out = strcat(out,out1,'\n');
            end
        end
    end
end

end
    
        