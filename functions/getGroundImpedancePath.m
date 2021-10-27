function out = getGroundImpedancePath(app)
projID=getProjectID(app);
wdir=getWorkingDirectory(app);
out = fullfile(wdir,projID,app.GroundImpedanceFile.Text);
end