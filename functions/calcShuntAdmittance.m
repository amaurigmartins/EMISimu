function [R,C] = calcShuntAdmittance(app,ntg,sec)

f = getFrequency(app);
attnum=getAttSet(app,LCC2TowNum(app,sec));
attdata=getAttSetData(app,attnum);

nph=getNumPhases(app);
nsw=getNumShieldWires(app);
% ntg=getNumTargets(app);

spanLength = getTargetSpanLength(app,sec);


[Rout, Rin, Rdc, TD] = getConductorData(app,char(attdata(nph+nsw+ntg,1)));
RhoCoat = str2double(attdata(nph+nsw+ntg,7));
ThickCoat = str2double(attdata(nph+nsw+ntg,8));
RelPermCoat = str2double(attdata(nph+nsw+ntg,9));
Rout = Rout/100;

%Z_shunt = shuntImpedanceCIGRE(f,Rout,RhoCoat,ThickCoat,RelPermCoat,spanLength);
Z_shunt = shuntImpedanceSES(f,Rout,RhoCoat,ThickCoat,RelPermCoat,spanLength);
Z_shunt = Z_shunt/2;

R = real(Z_shunt);
Xc = imag(Z_shunt);
C = -1/(2*pi*f*Xc)/(1e-6);

end
