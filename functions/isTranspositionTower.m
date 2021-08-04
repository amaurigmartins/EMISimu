function [out] = isTranspositionTower(app,sec)
out=false;
tscheme=getTranspositionScheme(app);

if tscheme==0
    return;
end
% 0 = untransposed
% 1 = L/3 L/3 L/3
% 2 = L/6 L/3 L/3 L/6
allspans=cell2mat(app.UITableSL.Data);
numsec=app.Numberofsections.Value;
L=cumsum(vpa(allspans))';
L = double(L);
totalLen=L(end);

if tscheme==1
    Ltransp=cumsum([totalLen/3 totalLen/3 totalLen/3]);
    if numsec==3
        out=ismember(sec,1:2);
        return;
    end
end

if tscheme==2
    Ltransp=cumsum([totalLen/6 totalLen/3 totalLen/3 totalLen/6]);
    if numsec==4
        out=ismember(sec,1:3);
        return;
    end
end

transp_idx = interp1(L,1:length(L),Ltransp,'nearest','extrap');

out=ismember(sec,transp_idx(1:end-1));


end