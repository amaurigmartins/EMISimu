function out = getProjectDesc(app)
out=app.ProjectdescriptionTextArea.Value;
out=cellfun(@(x) (['C ' x(:,:) '\n']),out,'UniformOutput',false);
out=join(out,"");
out=char(out);
end