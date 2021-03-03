function [out] = getLineModel(app)
out=valIfTrue(app,app.PiButton.Value==1,'pi',valIfTrue(app,app.BergeronButton.Value==1,'bergeron','jmarti'));
end

