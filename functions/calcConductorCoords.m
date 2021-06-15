function [out] = calcConductorCoords(app,x0,y0,nc,s)

switch nc
    case 1
        out=[x0 y0];
    case 2
        a=valIfTrue(app,s==0,.2,s/2);
        out=[x0-a y0; x0+a y0];
    case 4
        a=valIfTrue(app,s==0,.2,s/2);
        out=[x0-a y0-a; x0-a y0+a; x0+a y0-a; x0+a y0+a];
end

end