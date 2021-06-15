function out = getSelectedTow2GroundOutputs(app,fault_sec)

out=[];

if app.OrsectionsbeforeandafterfaultTowShuntParam.Value
    n=app.Tow2Ground.Value;
    numsec=app.Numberofsections.Value;
    out=fault_sec-n:fault_sec+n;
    out=out((out>=1 & out<=numsec));
else
    outputmap=app.UITableTow2Ground.Data;
    outputmap(any(cellfun(@isempty,outputmap),2),:) = [];
    if isempty(outputmap)
        return;
    end
    for i=1:size(outputmap,1)
        if cellfun(@isnumeric,(outputmap(i,1)));outputmap(i,1)={cellfun(@num2str, (outputmap(i,1)))};end;
        if cellfun(@isnumeric,(outputmap(i,2)));outputmap(i,2)={cellfun(@num2str, (outputmap(i,2)))};end;
    end
    outputmap=str2double(outputmap);
    for j=1:size(outputmap,1)
        out=[out  outputmap(j,1):outputmap(j,2)];
    end
    out=unique(out);
end

end