function [out] = getAttSetData(app,attset)
attsetdata=app.UITableAttSets.Data(attset);
attsetdata=jsondecode(char(attsetdata));

if ~strcmp(attsetdata,'undefined')
    out=struct2cell(attsetdata)';
else
    out=attsetdata;
end
                    
end