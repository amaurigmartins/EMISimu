function [out] = getGroundImpedance(app,sec)

app.UITableGroundImp.Data = num2cell(app.UITableGroundImp.Data);

out=cell2mat(app.UITableGroundImp.Data(sec,:));
end