function out = getLoadImpedance(app)

% If Delta Connection (AB)
out(1,1,1) = app.LoadR1C1T2.Value;
out(1,1,2) = app.LoadL1C1T2.Value; 
out(1,1,3) = app.LoadC1C1T2.Value;

% If Delta Connection (BC)
out(1,2,1) = app.LoadR2C1T2.Value; 
out(1,2,2) = app.LoadL2C1T2.Value; 
out(1,2,3) = app.LoadC2C1T2.Value; 

% If Delta Connection (CA)
out(1,3,1) = app.LoadR3C1T2.Value; 
out(1,3,2) = app.LoadL3C1T2.Value; 
out(1,3,3) = app.LoadC3C1T2.Value;

if getNumCircuits(app) == 2 && isT2Load(app,2) 
    % If Delta Connection (AB)
    out(2,1,1) = app.LoadR1C2T2.Value;
    out(2,1,2) = app.LoadL1C2T2.Value; 
    out(2,1,3) = app.LoadC1C2T2.Value;

    % If Delta Connection (BC)
    out(2,2,1) = app.LoadR2C2T2.Value; 
    out(2,2,2) = app.LoadL2C2T2.Value; 
    out(2,2,3) = app.LoadC2C2T2.Value; 

    % If Delta Connection (CA)
    out(2,3,1) = app.LoadR3C2T2.Value; 
    out(2,3,2) = app.LoadL3C2T2.Value; 
    out(2,3,3) = app.LoadC3C2T2.Value;
end

end