function [out] = getSEImpedance(app,term)
if term==1
    out(1,1)=app.RGG1T1.Value; %r ground
    out(1,2)=app.LGG1T1.Value; %l
    out(1,3)=app.CGG1T1.Value; %c
    
    out(2,1)=app.RNC1T1.Value; %r neutral
    out(2,2)=app.LNC1T1.Value; %l
    out(2,3)=app.CNC1T1.Value; %c
    
elseif term==2
    out(1,1)=app.RGG1T2.Value; %r ground
    out(1,2)=app.LGG1T2.Value; %l
    out(1,3)=app.CGG1T2.Value; %c
    
    out(2,1)=app.RNC1T2.Value; %r neutral
    out(2,2)=app.LNC1T2.Value; %l
    out(2,3)=app.CNC1T2.Value; %c
    
end
end