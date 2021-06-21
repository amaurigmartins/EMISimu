function out = LCC2TowNum(app,LCCnumber)

nsec = getNumSections(app);

ntw = getNumTowers(app);

    out = ones(nsec,1);

    Tow2LCC = TowNum2LCC(app,1:ntw);

    Tow2LCC(1) = 1;

    for i=2:ntw
       out(Tow2LCC(i-1)+1:Tow2LCC(i)) = i;
    end

    out = out(LCCnumber);

end