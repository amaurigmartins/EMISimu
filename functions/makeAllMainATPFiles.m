function out = makeAllMainATPFiles(app)
            projID=app.ProjectIDEditField.Value;
            wdir=app.WorkingdirectoryEditField.Value;
            projdir=fullfile(wdir,projID);
            orig_state = warning;warning('off','all');
            mkdir(projdir);
            warning(orig_state);
            fault_sec=getFaultedSections(app);
            app.ConsoleTextArea.Value=[app.ConsoleTextArea.Value;'Making ATP files...'];
            for k=1:length(fault_sec)
                app.ConsoleTextArea.Value=[app.ConsoleTextArea.Value;sprintf('Building fault model for section %d...\n',fault_sec(k))];
                fname=sprintf('%s_fault_sec%d.atp',projID,fault_sec(k));
                fid = fopen(fullfile(projdir,fname),'wt');
                fprintf(fid, makeMainATP(app,fault_sec(k)));
                fclose(fid);
            end
            app.ConsoleTextArea.Value=[app.ConsoleTextArea.Value;'Making ATP files... Done!'];
        end