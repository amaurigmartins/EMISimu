function out = writeTowGroundCard(app,RLC,sec,fault_sec)

listOfTowers=getSelectedTow2GroundOutputs(app,fault_sec);
listOfTowers=TowNum2LCC(app,listOfTowers);


if outputTow2GndCurr(app)
    if ismember(sec,listOfTowers)
        flag=1;
    else
        flag=0;
    end
else
    flag=0;
end

if outputTow2GndVolt(app)
    flag=flag+2;
end
    
out=blanks(80);
out(9:13)=sprintf('0%04d',sec);
out(27:42)=modprin(16,RLC(1));
out(43:58)=modprin(16,RLC(2));
out(59:74)=modprin(16,RLC(3));
out(80)=sprintf('%d',flag);
out=strcat(out,'\n');

end