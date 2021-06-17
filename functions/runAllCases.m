function out = runAllCases(projID,wdir,atpsolver,postproc,fault_sections,par,numwork)
numfiles=length(fault_sections);
out=[];
if par
    cluster = parcluster('local');
    cluster.NumWorkers = numwork;
    saveProfile(cluster);
    poolobj = gcp('nocreate');
    if isempty(poolobj)
        parpool('local',numwork);
    else
        poolsize = poolobj.NumWorkers;
    end
    parfor k=1:numfiles
        if isFaultStudy(app)
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.atp');
        else
            fname=strcat(projID,'nominal_load_study','.atp');
        end
            if exist(fullfile(wdir,projID,fname),'file')==2
                runATPsolver(atpsolver,fullfile(wdir,projID),fname);
            end
    end
    parfor k=1:numfiles
        if isFaultStudy(app)
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.pl4');
        else
            fname=strcat(projID,'nominal_load_study','.pl4');
        end
        if exist(fullfile(wdir,projID,fname),'file')==2
            runPL4converter(postproc,fullfile(wdir,projID),fname);
        end
    end
else
    for k=1:numfiles
        if isFaultStudy(app)
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.atp');
        else
            fname=strcat(projID,'nominal_load_study','.atp');
        end
        if exist(fullfile(wdir,projID,fname),'file')==2
            runATPsolver(atpsolver,fullfile(wdir,projID),fname);
        end
    end
    for k=1:numfiles
        if isFaultStudy(app)
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.pl4');
        else
            fname=strcat(projID,'nominal_load_study','.pl4');
        end
        if exist(fullfile(wdir,projID,fname),'file')==2
            runPL4converter(postproc,fullfile(wdir,projID),fname);
        end
    end
end
end