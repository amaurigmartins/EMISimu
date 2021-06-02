function out = makeAllLCCFiles(app)
            out=true;
            atpsolver=app.ATPSolverPath.Value;
            projID=app.ProjectID.Value;
            wdir=app.Workingdirectory.Value;
            projdir=fullfile(wdir,projID);
            tgtdir=fullfile(wdir,projID,'LCC');
            
            orig_state = warning;warning('off','all');
            mkdir(projdir);
            mkdir(tgtdir);
            addpath(fullfile(pwd,'functions'));
            warning(orig_state);
            
            num_sec=app.Numberofsections.Value;
            disp('Computing line parameters...');
            for k=1:num_sec
                fprintf('Processing LCC section %d...\n\n',k);
                fname=fprintf('lcc_sec%04d.atp\n',k);
                fid = fopen(fullfile(tgtdir,fname),'wt');
                fprintf(fid, makeLCCC(app,k));
                fclose(fid);
                try
                    runATPsolver(atpsolver,tgtdir,fname);
                catch
                    f = msgbox('Unable to run ATP solver!','You lose, fella.','error');
                    fprintf('Error occurred while processing section %d!\n',k);
                    out=false;
                    break;
                end
            end
            disp('Computing line parameters... Done!');
        end