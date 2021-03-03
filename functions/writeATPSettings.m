function [out] = writeATPSettings(app)

dT=app.deltaTsEditField.Value;
Tmax=app.TmaxsEditField.Value;

out1=blanks(80);
out2='     500       1       1       1       1       0       0       1       0\n';
out1(1:8)=modprin(app,8,dT);
out1(9:16)=modprin(app,8,Tmax);

out=strcat(out1,'\n',out2);

end