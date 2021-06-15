        function out = getFaultedSections(app)
            
            out=[];
            outputmap=app.UITableFaultSec.Data;
            outputmap(any(cellfun(@isempty,outputmap),2),:) = [];
            if isempty(outputmap)
                return;
            end
            try
                outputmap=cell2mat(outputmap);
            catch
                for i=1:size(outputmap,1)
                    if cellfun(@isnumeric,(outputmap(i,1)));outputmap(i,1)={cellfun(@num2str, (outputmap(i,1)))};end;
                    if cellfun(@isnumeric,(outputmap(i,2)));outputmap(i,2)={cellfun(@num2str, (outputmap(i,2)))};end;
                end
                outputmap=str2double(outputmap);
            end
            for j=1:size(outputmap,1)
                out=[out  outputmap(j,1):outputmap(j,2)];
            end
            out=unique(out);
            
        end