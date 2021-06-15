function out = getTargetTerminalGndImpedance(app,ntg)

out(1,1) = app.Target(ntg).GroundImpedanceT1.Value;
out(1,2) = app.Target(ntg).GroundImpedanceT2.Value;

end