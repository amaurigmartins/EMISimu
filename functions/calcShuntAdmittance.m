function [R,C] = calcShuntAdmittance(app,ntg,sec)

f = getFrequency(app);
attnum=getAttSet(app,LCC2TowNum(app,sec));
attdata=getAttSetData(app,attnum);

nph=getNumPhases(app);
nsw=getNumShieldWires(app);
% ntg=getNumTargets(app);

e0 = 8.8542e-12;

spanLength = getTargetSpanLength(app,sec);


[Rout, Rin, Rdc, TD] = getConductorData(app,char(attdata(nph+nsw+ntg,1)));
RhoCoat = str2double(attdata(nph+nsw+ntg,7));
ThickCoat = str2double(attdata(nph+nsw+ntg,8));
RelPermCoat = str2double(attdata(nph+nsw+ntg,9));
Rout = Rout/100;
Y_shunt = ((2*pi*Rout)/(RhoCoat*ThickCoat)) + 2i*pi*f*((e0*RelPermCoat*2*pi*Rout)/(ThickCoat));
Y_shunt = Y_shunt*spanLength;

R = real(1/Y_shunt)/2;
Xc = imag(1/Y_shunt);
C = -1/(2*pi*f*Xc)/(2*1e-6);

end
