function out = getFaultedTowNum2LCC(app)


faltedTowers = [];

for i = 1: size(app.FaultedSection(:),1)
    aux = app.FaultedSection(i).From.Value:1:app.FaultedSection(i).To.Value;
    
    faltedTowers = [faltedTowers aux];
    
end

faltedTowers= sort(transpose(faltedTowers));

TowerLCCnumber = getAllTowNum2LCC(app);

out = TowerLCCnumber(faltedTowers);

end