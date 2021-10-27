function out = getSoilResistivityPath(app)
projID=getProjectID(app);
wdir=getWorkingDirectory(app);
out = fullfile(wdir,projID,app.SoilResistivityFile.Text);
end