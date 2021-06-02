function [nsw] = getNumShieldWires(app)
nsw=valIfTrue(app,app.NoneSW.Value==1,0,valIfTrue(app,app.SingleSW.Value==1,1,2));
end

