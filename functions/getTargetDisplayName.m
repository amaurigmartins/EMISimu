function out = getTargetDisplayName(app,ntg)
out = string(app.Target(ntg).DisplayName.Text);
end