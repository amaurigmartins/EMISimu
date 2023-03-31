function [out] = parseAttSetData(app,sec)

INF_DIST=1e10;
TOL=1e-5;

attnum=getAttSet(app,LCC2TowNum(app,sec));
attdata=getAttSetData(app,attnum);

nph=getNumPhases(app);
nsw=getNumShieldWires(app);
ntg=getNumTargets(app);

% test condition on Leq and set deq/Leq appropriately
% A GAMBIARRA PARA MODELAR O ACOPLAMENTO DE 90 RGAUS S� EXISTE AQUI!!!!1
deq=getEquivalentDistance(app,sec);
Leq = max(TOL, getSpanLen(app,sec)/1000);

if Leq == TOL
    L1 = getSourceSpanLength(app,sec)/1000;
    L2 = getTargetSpanLength(app,sec)/1000;
    deq = INF_DIST;
    Leq = sqrt(L1*L2);
end
    

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
        thisrow=[i TD Rdc KTYPE 2*Rout tmpcoords(k,1) tmpcoords(k,2) tmpcoords(k,2) Leq];
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
            if str2double(attdata(nph+i,10)) % Kron Reduction
                thisrow=[0 TD Rdc KTYPE 2*Rout tmpcoords(k,1) tmpcoords(k,2) tmpcoords(k,2) Leq];
            else
                thisrow=[nph+1 TD Rdc KTYPE 2*Rout tmpcoords(k,1) tmpcoords(k,2) tmpcoords(k,2) Leq];              
            end
            out=vertcat(out,thisrow);
        end
    end
end

ind_nsw = getDetachedSWindex(app);

if ntg>0
    for i=1:ntg
        [Rout, Rin, ~, TD] = getConductorData(app,char(attdata(nph+nsw+i,1)));
        nc=str2double(attdata(nph+nsw+i,2));
        s=str2double(attdata(nph+nsw+i,3));
        x0=sign(deq)*(str2double(attdata(nph+nsw+i,4))) + deq;
        y0=abs(str2double(attdata(nph+nsw+i,5)));
        tmpcoords=calcConductorCoords(app,x0,y0,nc,s);
        Rdc = pipeRdc(Rin,Rout,10,1000);
        for k=1:nc
            thisrow=[nph+ind_nsw+i TD Rdc KTYPE 2*Rout tmpcoords(k,1) tmpcoords(k,2) tmpcoords(k,2) Leq];
            out=vertcat(out,thisrow);
        end
    end
end

end