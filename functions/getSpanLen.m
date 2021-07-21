function [out] = getSpanLen(app,sec)
out=cell2mat(app.UITableSL.Data(sec))/1000;
end

