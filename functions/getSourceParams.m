function [term1, term2] = getSourceParams(app)
ncirc=valIfTrue(app,app.DoublecircuitButton.Value==1,2,1);

term1(1,1)=2*app.RMSLLamplitudeV1EditFieldT1.Value/(sqrt(2)*sqrt(3)); %amplitude
term1(1,2)=app.FrequencyHz1EditFieldT1.Value; %freq
term1(1,3)=app.Phaseangledeg1EditFieldT1.Value; %angle
term1(1,4)=app.Tstarts1EditFieldT1.Value; %tstart
term1(1,5)=app.Tstops1EditFieldT1.Value; %tstop

term2(1,1)=2*app.RMSLLamplitudeV1EditFieldT2.Value/(sqrt(2)*sqrt(3)); %amplitude
term2(1,2)=app.FrequencyHz1EditFieldT2.Value; %freq
term2(1,3)=app.Phaseangledeg1EditFieldT2.Value; %angle
term2(1,4)=app.Tstarts1EditFieldT2.Value; %tstart
term2(1,5)=app.Tstops1EditFieldT2.Value; %tstop

if ncirc==2
    term1(2,1)=2*app.RMSLLamplitudeV2EditFieldT1.Value/(sqrt(2)*sqrt(3)); %amplitude
    term1(2,2)=app.FrequencyHz2EditFieldT1.Value; %freq
    term1(2,3)=app.Phaseangledeg2EditFieldT1.Value; %angle
    term1(2,4)=app.Tstarts2EditFieldT1.Value; %tstart
    term1(2,5)=app.Tstops2EditFieldT1.Value; %tstop
    
    term2(2,1)=2*app.RMSLLamplitudeV2EditFieldT2.Value/(sqrt(2)*sqrt(3)); %amplitude
    term2(2,2)=app.FrequencyHz2EditFieldT2.Value; %freq
    term2(2,3)=app.Phaseangledeg2EditFieldT2.Value; %angle
    term2(2,4)=app.Tstarts2EditFieldT2.Value; %tstart
    term2(2,5)=app.Tstops2EditFieldT2.Value; %tstop
end

end