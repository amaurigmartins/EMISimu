

srcCoord = getSourceCoords(app); 
tgtCoord = getTargetCoords(app);
minTargetLength = getMinTargetLength(app);

[GeometricData, LCCData] = calcCouplingRegionsParams(srcCoord,tgtCoord,minTargetLength);

app.UITableSL.Data = num2cell(LCCData(:,2));

app.CoupRegTable.EquivalentDistance.Data = LCCData(:,1);
app.CoupRegTable.EquivalentLength.Data = LCCData(:,2);
app.CoupRegTable.AccTargetDistance.Data = LCCData(:,3);
app.CoupRegTable.SourceGroundingIndex.Data = LCCData(:,4);
app.CoupRegTable.TargetSpanLength.Data = GeometricData(:,8);
app.CoupRegTable.SourceSpanLength.Data = GeometricData(:,7);
app.CoupRegTable.SubTargetCoordX.Data = GeometricData(:,3);
app.CoupRegTable.SubTargetCoordY.Data = GeometricData(:,4);
app.CoupRegTable.SubSourceCoordX.Data = GeometricData(:,1);
app.CoupRegTable.SubSourceCoordY.Data = GeometricData(:,2);

app.Numberofsections.Value = size(LCCData,1);





