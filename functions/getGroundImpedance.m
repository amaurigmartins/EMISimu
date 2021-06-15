function [out] = getGroundImpedance(app,sec)

out=cell2mat(app.UITableGroundImp.Data(sec,:));
end