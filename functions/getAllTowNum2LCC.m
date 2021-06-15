function out = getAllTowNum2LCC(app)

[out,~] = find(app.CoupRegTable.SourceGroundingIndex.Data == 1);

out = [0;out];

end
