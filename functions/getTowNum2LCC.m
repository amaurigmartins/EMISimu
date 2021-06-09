function out = getTowNum2LCC(app)


faltedTowers = [];

for i = 1: size(app.FaultedSection(:),1)
    aux = app.FaultedSection(i).From.Value:1:app.FaultedSection(i).To.Value;
    
    faltedTowers = [faltedTowers aux];
    
end

faltedTowers= sort(transpose(faltedTowers));

[TowerLCCnumber,~] = find(app.CoupRegTable.SourceGroundingIndex.Data == 1);

TowerLCCnumber = [0;TowerLCCnumber];

out = TowerLCCnumber(faltedTowers);

end