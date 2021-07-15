function out = writeTerminalGroundCard(app)

ncirc = app.NumberofCircuits.Value; 
out=[];
seq='ABC';

for i = 1:ncirc
    for j=1:3
        tmp_out=blanks(80);
        tmp_out(9:14)=sprintf('TH%dT%d%s',i,2,seq(j));
        tmp_out(27:42)=modprin(16,1);
        tmp_out(43:58)=modprin(16,0);
        tmp_out(59:74)=modprin(16,0);
        tmp_out(80)='0';
        out=strcat(out,tmp_out,'\n');
    end
end