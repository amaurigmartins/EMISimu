function [RG, RF] = getFaultResistances(app)

RG=app.Phasetogroundresistance.Value;
RF=app.Phasetophaseresistance.Value;

end