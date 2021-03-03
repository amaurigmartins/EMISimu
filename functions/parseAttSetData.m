function [out] = parseAttSetData(app,sec)

attnum=getAttSet(app,sec);
attdata=getAttSetData(app,attnum);

nph=getNumPhases(app);
nsw=getNumShieldWires(app);

KTYPE=4; %see rule book, sectn 9, vol 2, pg 9-13

out=[];
for i=1:nph
    [Rout, Rin, Rdc, TD] = getConductorData(app,char(attdata(i,1)));
    nc=str2double(attdata(i,2));
    s=str2double(attdata(i,3));
    x0=str2double(attdata(i,4));
    y0=str2double(attdata(i,5));
    tmpcoords=calcConductorCoords(app,x0,y0,nc,s);
    for k=1:nc
        thisrow=[i TD Rdc KTYPE 2*Rout tmpcoords(k,1) tmpcoords(k,2) tmpcoords(k,2)];
        out=vertcat(out,thisrow);
    end
end

if nsw>0
    for i=1:nsw
        [Rout, Rin, Rdc, TD] = getConductorData(app,char(attdata(nph+i,1)));
        nc=str2double(attdata(nph+i,2));
        s=str2double(attdata(nph+i,3));
        x0=str2double(attdata(nph+i,4));
        y0=str2double(attdata(nph+i,5));
        tmpcoords=calcConductorCoords(app,x0,y0,nc,s);
        for k=1:nc
            thisrow=[nph+1 TD Rdc KTYPE 2*Rout tmpcoords(k,1) tmpcoords(k,2) tmpcoords(k,2)];
            out=vertcat(out,thisrow);
        end
    end
end

end