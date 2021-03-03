function [nphases] = getNumPhases(app)
nphases=valIfTrue(app,app.SinglecircuitButton.Value==1,3,6);
end

