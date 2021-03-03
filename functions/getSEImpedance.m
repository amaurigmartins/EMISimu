function [out] = getSEImpedance(app,term)
if term==1
    out(1,1)=app.RGG1EditFieldT1.Value; %r ground
    out(1,2)=app.LGG1EditFieldT1.Value; %l
    out(1,3)=app.CGG1EditFieldT1.Value; %c
    
    out(2,1)=app.RNC1EditFieldT1.Value; %r neutral
    out(2,2)=app.LNC1EditFieldT1.Value; %l
    out(2,3)=app.CNC1EditFieldT1.Value; %c
    
elseif term==2
    out(1,1)=app.RGG1EditFieldT2.Value; %r ground
    out(1,2)=app.LGG1EditFieldT2.Value; %l
    out(1,3)=app.CGG1EditFieldT2.Value; %c
    
    out(2,1)=app.RNC1EditFieldT2.Value; %r neutral
    out(2,2)=app.LNC1EditFieldT2.Value; %l
    out(2,3)=app.CNC1EditFieldT2.Value; %c
    
end
end