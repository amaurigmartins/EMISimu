function out = getFaultType(app)

ftype=split(app.FaulttypeFTYPEButtonGroup.SelectedObject.Text,' - ');

out=str2double(ftype(1));

end