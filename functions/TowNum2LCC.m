function out = TowNum2LCC(app,towers)

% towers = vetor com os numeros das torres [1 2 3 4 4 666 1234]

[out,~] = find(app.CoupRegTable.SourceGroundingIndex.Data == 1);

out = [0;out];

out = out(towers);

% out é algum processamento desse vvetor que sai o numero do LCC

end