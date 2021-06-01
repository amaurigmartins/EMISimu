function out = makeAllLCCFiles(app)
            out=true;
            atpsolver=app.ATPsolverEditField.Value;
            projID=app.ProjectIDEditField.Value;
            wdir=app.WorkingdirectoryEditField.Value;
            projdir=fullfile(wdir,projID);
            tgtdir=fullfile(wdir,projID,'LCC');
            
            orig_state = warning;warning('off','all');
            mkdir(projdir);
            mkdir(tgtdir);
            addpath(fullfile(pwd,'functions'));
            warning(orig_state);
            
            num_sec=app.NumberofsectionsSpinner.Value;
            app.ConsoleTextArea.Value=[app.ConsoleTextArea.Value;'Computing line parameters...'];
            for k=1:num_sec
                app.ConsoleTextArea.Value=[app.ConsoleTextArea.Value;sprintf('Processing LCC section %d...\n',k)];
                fname=sprintf('lcc_sec%04d.atp',k);
                fid = fopen(fullfile(tgtdir,fname),'wt');
                fprintf(fid, makeLCCC(app,k));
                fclose(fid);
                try
                    runATPsolver(atpsolver,tgtdir,fname);
                catch
                    f = msgbox('Unable to run ATP solver!','You lose, fella.','error');
                    app.ConsoleTextArea.Value=[app.ConsoleTextArea.Value;sprintf('Error occurred while processing section %d!\n',k)];
                    out=false;
                    break;
                end
            end
            app.ConsoleTextArea.Value=[app.ConsoleTextArea.Value;'Computing line parameters... Done!'];
        end