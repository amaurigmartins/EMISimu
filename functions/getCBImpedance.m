function out = getCBImpedance(app)

% If Delta Connection (AB)
out(1,1,1) = app.CBImpedanceR1C1.Value;
out(1,1,2) = app.CBImpedanceL1C1.Value; 
out(1,1,3) = app.CBImpedanceC1C1.Value;

% If Delta Connection (BC)
out(1,2,1) = app.CBImpedanceR2C1.Value; 
out(1,2,2) = app.CBImpedanceL2C1.Value; 
out(1,2,3) = app.CBImpedanceC2C1.Value; 

% If Delta Connection (CA)
out(1,3,1) = app.CBImpedanceR3C1.Value; 
out(1,3,2) = app.CBImpedanceL3C1.Value; 
out(1,3,3) = app.CBImpedanceC3C1.Value;

%Grounding connection
out(1,4,1) = app.CBGroundImpedanceRC1.Value; %Rgnd [ohm]
out(1,4,2) = app.CBGroundImpedanceLC1.Value; %Lgnd [mH]
out(1,4,3) = app.CBGroundImpedanceCC1.Value; %Cgnd [uF]

if getNumCircuits(app) == 2 && isCBSwitchedCircuit(app,2)
    % If Delta Connection (AB)
    out(2,1,1) = app.CBImpedanceR1C2.Value;
    out(2,1,2) = app.CBImpedanceL1C2.Value; 
    out(2,1,3) = app.CBImpedanceC1C2.Value;

    % If Delta Connection (BC)
    out(2,2,1) = app.CBImpedanceR2C2.Value; 
    out(2,2,2) = app.CBImpedanceL2C2.Value; 
    out(2,2,3) = app.CBImpedanceC2C2.Value; 

    % If Delta Connection (CA)
    out(2,3,1) = app.CBImpedanceR3C2.Value; 
    out(2,3,2) = app.CBImpedanceL3C2.Value; 
    out(2,3,3) = app.CBImpedanceC3C2.Value;
    
    %Grounding connection
    out(2,4,1) = app.CBGroundImpedanceRC2.Value; %Rgnd [ohm]
    out(2,4,2) = app.CBGroundImpedanceLC2.Value; %Lgnd [mH]
    out(2,4,3) = app.CBGroundImpedanceCC2.Value; %Cgnd [uF]
end

end