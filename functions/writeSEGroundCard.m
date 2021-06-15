function out = writeSEGroundCard(app,RLC,term)

out1=blanks(80);
out2=blanks(80);

out1(9:14)=sprintf('GNDSE%d',term);
out1(27:42)=modprin(app,16,RLC(1,1));
out1(43:58)=modprin(app,16,RLC(1,2));
out1(59:74)=modprin(app,16,RLC(1,3));
out1(80)='3';

if term==1
    termIdx=0;
elseif term==2
    termIdx=app.Numberofsections.Value;
end

out2(3:8)=sprintf('GNDSE%d',term);
out2(9:13)=sprintf('0%04d',termIdx);
out2(27:42)=modprin(app,16,RLC(2,1));
out2(43:58)=modprin(app,16,RLC(2,2));
out2(59:74)=modprin(app,16,RLC(2,3));
out2(80)='0';

out=strcat(out1,'\n',out2,'\n');


end