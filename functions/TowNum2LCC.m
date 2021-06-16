function out = TowNum2LCC(app,towers)

% towers = vetor com os numeros das torres

[out,~] = find(app.CoupRegTable.SourceGroundingIndex.Data == 1);

out = [0;out];

% out é algum processamento desse vvetor

end