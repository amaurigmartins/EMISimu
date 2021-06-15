function [tgtCoord] = getTargetCoords(app)

tgtCoord = [cell2mat(app.TargetCoordX.Data) cell2mat(app.TargetCoordY.Data)];

end