function out = getEnergizationSwitchTime(app)

out(1,1) = app.SWStartC1T1A.Value;
out(1,2) = app.SWStartC1T1B.Value;
out(1,3) = app.SWStartC1T1C.Value;

out(2,1) = app.SWStartC2T1A.Value;
out(2,2) = app.SWStartC2T1B.Value;
out(2,3) = app.SWStartC2T1C.Value;

end