function [out] = getLineModelParams(app)
out=struct;
out.frequency=double(app.LCCfrequencyHzEditField.Value);
if strcmp(getLineModel(app),'jmarti')
    out.decades=double(app.DecadesSpinner.Value);
    out.points_per_decade=double(app.PointsDecadeSpinner.Value);
    out.freq_matrix=double(app.FreqmatrixHzEditField.Value);
    out.freq_ss=double(app.FreqSSHzEditField.Value);
end
end

