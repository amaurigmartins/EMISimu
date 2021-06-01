

srcCoord = getSourceCoords(app); 
tgtCoord = getTargetCoords(app);
minTargetLength = getMinTargetLength(app);

[CoupRegionsTable, matrixLCC] = calcCouplingRegionsParams(srcCoord,tgtCoord,minTargetLength);

app.UITableSL.Data = num2cell(matrixLCC(:,2));

app.CoupRegTable.EquivalentDistance.Data = matrixLCC(:,1);
app.CoupRegTable.EquivalentLength.Data = matrixLCC(:,2);
app.CoupRegTable.AccTargetDistance.Data = matrixLCC(:,3);
app.CoupRegTable.SourceGroundingIndex.Data = matrixLCC(:,4);
app.CoupRegTable.TargetSpanLength.Data = CoupRegionsTable(:,8);
app.CoupRegTable.SourceSpanLength.Data = CoupRegionsTable(:,7);
app.CoupRegTable.SubTargetCoordX.Data = CoupRegionsTable(:,3);
app.CoupRegTable.SubTargetCoordY.Data = CoupRegionsTable(:,4);
app.CoupRegTable.SubSourceCoordX.Data = CoupRegionsTable(:,1);
app.CoupRegTable.SubSourceCoordY.Data = CoupRegionsTable(:,2);

app.Numberofsections.Value = size(matrixLCC,1);





