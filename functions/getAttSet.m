function [out] = getAttSet(app,sec)

defattset=str2double(app.Defaultattributeset.Value);

attsetmap=app.UITableAttSetSec.Data;
attsetmap(any(cellfun(@isempty,attsetmap),2),:) = [];

out=defattset;

if isempty(attsetmap)
    return;
end

attsetmap=str2double(attsetmap);
attsetmap=attsetmap(find(attsetmap(attsetmap(:,2)>=attsetmap(:,1))),:);

for k=1:size(attsetmap,1)
    if sec >=attsetmap(k,1) && sec <= attsetmap(k,2)
        out=attsetmap(k,3);
    end
end

end