function out = runAllCases(projID,wdir,atpsolver,postproc,fault_sections,par,numwork,isfault_study)
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
        if isfault_study
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.atp');
        else
            fname=strcat('nominal_load_study','.atp');
        end
            if exist(fullfile(wdir,projID,fname),'file')==2
                runATPsolver(atpsolver,fullfile(wdir,projID),fname);
            end
    end
    parfor k=1:numfiles
        if isfault_study
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.pl4');
        else
            fname=strcat('nominal_load_study','.pl4');
        end
        if exist(fullfile(wdir,projID,fname),'file')==2
            runPL4converter(postproc,fullfile(wdir,projID),fname);
        end
    end
else
    for k=1:numfiles
        if isfault_study
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.atp');
        else
            fname=strcat('nominal_load_study','.atp');
        end
        if exist(fullfile(wdir,projID,fname),'file')==2
            runATPsolver(atpsolver,fullfile(wdir,projID),fname);
        end
    end
    for k=1:numfiles
        if isfault_study
            fname=strcat(projID,'_fault_sec',sprintf('%d',fault_sections(k)),'.pl4');
        else
            fname=strcat('nominal_load_study','.pl4');
        end
        if exist(fullfile(wdir,projID,fname),'file')==2
            runPL4converter(postproc,fullfile(wdir,projID),fname);
        end
    end
end
end