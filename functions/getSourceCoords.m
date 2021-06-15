function [srcCoord] = getSourceCoords(app)

srcCoord = [cell2mat(app.SourceCoordX.Data) cell2mat(app.SourceCoordY.Data)];

end