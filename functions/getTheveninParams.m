function [term1, term2] = getTheveninParams(app)
ncirc=valIfTrue(app,app.DoublecircuitButton.Value==1,2,1);

term1(1,1)=app.R0S1EditFieldT1.Value; %R0
term1(1,2)=app.L0S1EditFieldT1.Value; %L0
term1(1,3)=app.R1S1EditFieldT1.Value; %R+
term1(1,4)=app.L1S1EditFieldT1.Value; %L+

term2(1,1)=app.R0S1EditFieldT2.Value; %R0
term2(1,2)=app.L0S1EditFieldT2.Value; %L0
term2(1,3)=app.R1S1EditFieldT2.Value; %R+
term2(1,4)=app.L1S1EditFieldT2.Value; %L+

if ncirc==2
    term1(2,1)=app.R0S2EditFieldT1.Value; %R0
    term1(2,2)=app.L0S2EditFieldT1.Value; %L0
    term1(2,3)=app.R1S2EditFieldT1.Value; %R+
    term1(2,4)=app.L1S2EditFieldT1.Value; %L+
    
    term2(2,1)=app.R0S2EditFieldT2.Value; %R0
    term2(2,2)=app.L0S2EditFieldT2.Value; %L0
    term2(2,3)=app.R1S2EditFieldT2.Value; %R+
    term2(2,4)=app.L1S2EditFieldT2.Value; %L+

end

end