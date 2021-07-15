function out = shuntImpedanceCIGRE(f,Rout,RhoCoat,ThickCoat,RelPermCoat,L)

e0 = 8.8542e-12;

Y_shunt = ((2*pi*Rout)/(RhoCoat*ThickCoat)) + 2i*pi*f*((e0*RelPermCoat*2*pi*Rout)/(ThickCoat));
Y_shunt = Y_shunt*L;

out = 1/Y_shunt;

end