function out = writeLCCPunchFile(app,sec)
projID=app.ProjectID.Value;
wdir=app.Workingdirectory.Value;
tgtdir=fullfile(wdir,projID,'LCC');
fname=sprintf('lcc_sec%04d.pch',sec)
out=fileread(fullfile(tgtdir,fname));
out = regexprep(out, {'\r', '\n\n+'}, {'', '\n'});
out=strcat(out,'\n');
end