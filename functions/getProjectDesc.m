function out = getProjectDesc(app)
out=app.Projectdescription.Text;
out=cellfun(@(x) (['C ' x(:,:) '\n']),out,'UniformOutput',false);
out=join(out,"");
out=char(out);
end