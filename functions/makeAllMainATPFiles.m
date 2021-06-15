function out = makeAllMainATPFiles(app)
            projID=getProjectID(app);
            wdir=getWorkingDirectory(app);
            projdir=fullfile(wdir,projID);
            orig_state = warning;warning('off','all');
            mkdir(projdir);
            warning(orig_state);
%             fault_sec=getFaultedSections(app);
            if isFaultStudy(app)
                fault_sec = getFaultedTowNum2LCC(app);
                disp('Making ATP files...');
                for k=1:length(fault_sec)
                    fprintf('Building fault model for section %d...\n',fault_sec(k));
                    fname=sprintf('%s_fault_sec%d.atp',projID,fault_sec(k));
                    fid = fopen(fullfile(projdir,fname),'wt');
                    fprintf(fid, makeMainATP(app,fault_sec(k)));
                    fclose(fid);
                end
            else
                fault_sec = 1;
                disp('Making ATP file...');
                fprintf('Building a nominal load induction model...');
                fname=sprintf('nominal_load_study.atp');
                fid = fopen(fullfile(projdir,fname),'wt');
                fprintf(fid, makeMainATP(app,fault_sec));
                fclose(fid);
            end
            disp('Making ATP files... Done!');                 
end