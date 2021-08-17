function out = getCBTower(app,circuit)

if circuit == 1
    out = app.CBTowerC1.Value;
else % circuit == 2
    out = app.CBTowerC2.Value;
end

end