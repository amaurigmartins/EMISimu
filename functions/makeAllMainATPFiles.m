function out = makeAllMainATPFiles(app)
            projID=getProjectID(app);
            wdir=getWorkingDirectory(app);
            projdir=fullfile(wdir,projID);
            orig_state = warning;warning('off','all');
            mkdir(projdir);
            warning(orig_state);
            fault_tower=getFaultedSections(app);
            fault_sec=TowNum2LCC(app,getFaultedSections(app));
            disp('Making ATP files...');
            if isFaultStudy(app)
                for k=1:length(fault_sec)
                    fprintf('Building fault model for tower %d...\n',fault_tower(k));
                    fname=sprintf('%s_fault_sec%d.atp',projID,fault_tower(k));
                    fid = fopen(fullfile(projdir,fname),'wt');
                    fprintf(fid, makeMainATP(app,fault_sec(k)));
                    fclose(fid);
                end
            elseif isEnergizationStudy(app)    
                disp('Building a energization transient induction model...');
                fname=sprintf('%s_energization_study.atp',projID);
                fid = fopen(fullfile(projdir,fname),'wt');
                fprintf(fid, makeMainATP(app,fault_sec));
                fclose(fid);
            else
%                 fault_sec = 1;
                disp('Building a nominal load induction model...');
                fname=sprintf('%s_nominal_load_study.atp',projID);
                fid = fopen(fullfile(projdir,fname),'wt');
                fprintf(fid, makeMainATP(app,fault_sec));
                fclose(fid);
            end
            disp('Making ATP files... Done!');                 
end