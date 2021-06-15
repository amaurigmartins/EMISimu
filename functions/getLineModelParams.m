function [out] = getLineModelParams(app)
out=struct;
out.frequency=double(app.LCCfrequency.Value);
if strcmp(getLineModel(app),'jmarti')
    out.decades=double(app.Decades.Value);
    out.points_per_decade=double(app.PointsDecade.Value);
    out.freq_matrix=double(app.Freqmatrix.Value);
    out.freq_ss=double(app.FreqSS.Value);
end
end

