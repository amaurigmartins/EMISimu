function [term1, term2] = getSourceParams(app)
% ncirc=valIfTrue(app,app.Doublecircuit.Value==1,2,1);
ncirc = app.NumberofCircuits.Value; 

term1(1,1)=2*app.RMSLLamplitudeC1T1.Value/(sqrt(2)*sqrt(3)); %amplitude
term1(1,2)=app.FrequencyC1T1.Value; %freq
term1(1,3)=app.PhaseangleC1T1.Value; %angle
term1(1,4)=app.TstartsC1T1.Value; %tstart
term1(1,5)=app.TstopsC1T1.Value; %tstop

term2(1,1)=2*app.RMSLLamplitudeC1T2.Value/(sqrt(2)*sqrt(3)); %amplitude
term2(1,2)=app.FrequencyC1T2.Value; %freq
term2(1,3)=app.PhaseangleC1T2.Value; %angle
term2(1,4)=app.TstartsC1T2.Value; %tstart
term2(1,5)=app.TstopsC1T2.Value; %tstop

if ncirc==2
    term1(2,1)=2*app.RMSLLamplitudeC2T1.Value/(sqrt(2)*sqrt(3)); %amplitude
    term1(2,2)=app.FrequencyC2T1.Value; %freq
    term1(2,3)=app.PhaseangleC2T1.Value; %angle
    term1(2,4)=app.TstartsC2T1.Value; %tstart
    term1(2,5)=app.TstopsC2T1.Value; %tstop
    
    term2(2,1)=2*app.RMSLLamplitudeC2T2.Value/(sqrt(2)*sqrt(3)); %amplitude
    term2(2,2)=app.FrequencyHzC2T2.Value; %freq
    term2(2,3)=app.PhaseangleC2T2.Value; %angle
    term2(2,4)=app.TstartsC2T2.Value; %tstart
    term2(2,5)=app.TstopsC2T2.Value; %tstop
end

end