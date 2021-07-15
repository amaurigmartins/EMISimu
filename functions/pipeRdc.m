function Rdc = pipeRdc(Rin,Rout,relRho,L)

% DESCRIPTION:
% Rin - internal radius [m]
% Rout - external radius [m]
% relRho - metal relative resistivity [p.u.]
% L - Pipe length [m]
%
% OUT: Rdc - DC resistance [ohms]

rhoCu = 1.72e-8;

rho = relRho*rhoCu;

A = 2*pi*Rout*(Rout-Rin);

Rdc = rho*L/A;

end