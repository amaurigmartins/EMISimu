function [out] = runPL4converter(spath,wdir,fname)

cmd=['"' spath '" ' '"' fullfile(wdir,fname) '"'];

if exist(fullfile(wdir,fname),'file')==2
    fprintf('Post-processing file %s...\n',fname);
    out=system(cmd);
end

end

