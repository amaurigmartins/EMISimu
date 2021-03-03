function [nsw] = getNumShieldWires(app)
nsw=valIfTrue(app,app.NoneSWButton.Value==1,0,valIfTrue(app,app.SingleSWButton.Value==1,1,2));
end

