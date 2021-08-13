function out = isEnergizationStudy(app)

if strcmp(app.TransientType.Text,'energization')
    out = true;
else
    out = false;
end
    