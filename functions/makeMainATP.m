function [out] = makeMainATP(app, fault_sec)

% header
out='BEGIN NEW DATA CASE\n';
out=strcat(out, sprintf('C Project ID: %s',getProjectID(app)));
out=strcat(out, '\nC Project description:\n');
out=strcat(out, getProjectDesc(app));
out=strcat(out, sprintf('C Case description: fault simulation at section %d.',fault_sec));
out=strcat(out, '\nC EMISimu developed by C. Missiaggia Moraes and A. Martins-Britto, 2021.\n');
out=strcat(out, 'C Reference: Realistic Modeling of Power Lines for Transient Electromagnetic Interference Studies \nC DOI: 10.13140/RG.2.2.29709.56800\nC ******\n');
out=strcat(out, '$DUMMY, XYZ000\n');
out=strcat(out, 'C  dT  >< Tmax >< Xopt >< Copt ><Epsiln>\n');
out=strcat(out, writeATPSettings(app));

%models
out=strcat(out, writeFaultModels(app));

%branch - now the fun begins
out=strcat(out, '/BRANCH\n');
out=strcat(out, 'C < n 1>< n 2><ref1><ref2><       R      ><      L       ><      C       ><   >\n');
out=strcat(out, 'C < n 1>< n 2><ref1><ref2><     R    ><    A     ><    B     ><  Lenght  ><><>0\n');
     % short circuit thevenin equivalents
[T1, T2]=getTheveninParams(app);
out=strcat(out, writeThEqCard(app,T1,1));
out=strcat(out, writeThEqCard(app,T2,2));
out=strcat(out, '$VINTAGE,1\n');
    % Terminal 2 ground impedances (Only if current source)
% if ~isVoltageSource(app)
%     out = strcat(out, writeTerminalGroundCard(app));
% end
sw_detached = getDetachedSWindex(app);

ntw=getNumTowers(app);
tower2LCCnum = TowNum2LCC(app,1:ntw);
nsec = getNumSections(app);
% tower ground impedances
if sw_detached
    for i=1:ntw
        out=strcat(out, writeTowGroundCard(app,getGroundImpedance(app,i),tower2LCCnum(i),fault_sec));
    end
    % substation ground impedances + neutral connections
    out=strcat(out, writeSEGroundCard(app,getSEImpedance(app,1),1));
    out=strcat(out, writeSEGroundCard(app,getSEImpedance(app,2),2));
else
    out=strcat(out, writeTowGroundCard(app,[1e-5 0 0],fault_sec,fault_sec));
end
     % fault components
out=strcat(out, writeFaultBranchComponents(app));
    % Load impedances (if exist)
out = strcat(out, writeLoadCard(app));
    % CB impedances (if exists)
out = strcat(out, writeCBImpedanceCard(app));

out=strcat(out, '$VINTAGE,0\n');
     % target terminal impedances
ntg=getNumTargets(app);
for i=1:ntg    
    out = strcat(out, writeTargetTerminalGndCard(app,getTargetTerminalGndImpedance(app,i),i));
end 
     % target shunt admittances
for i=1:nsec
    for j=1:ntg
        out=strcat(out, writeTargetShuntAdmittance(app,j,i));
    end
end
     % include LCC pch files
for i=1:nsec
    out=strcat(out, writeLCCPunchFile(app,i));
end
listOfShWires=getSelectedShWireOutputs(app,fault_sec);
listOfShWires=TowNum2LCC(app,listOfShWires);

%switch - current measurements
out=strcat(out, '/SWITCH\n');
out=strcat(out, 'C < n 1>< n 2>< Tclose ><Top/Tde ><   Ie   ><Vf/CLOP ><  type  >\n');
out=strcat(out, writePhaseCurrProbesCard(app,1));
out=strcat(out, writePhaseCurrProbesCard(app,2));
% CB Switch (if exist)
out=strcat(out, writeCBSwitch(app));

if outputShWireCurr(app) && sw_detached
    for i=0:nsec
        if ismember(i,listOfShWires)
            measure_status=1;
        else
            measure_status=0;
        end
        out=strcat(out, writeShWireCurrProbesCard(app,i, measure_status, fault_sec));
    end
end
out=strcat(out, writeFaultBranchConnections(app,fault_sec));

% target longitudinal current switch
if outputTargetLongCurr(app)
    measure_status = 1;
else
    measure_status = 0;
end
for i=1:nsec
    for j = 1:ntg
        out = strcat(out, writeTargetLongCurrProbesCard(app,j,measure_status,i));
    end
end


%source
out=strcat(out, '/SOURCE\n');
out=strcat(out, 'C < n 1><>< Ampl.  >< Freq.  ><Phase/T0><   A1   ><   T1   >< TSTART >< TSTOP  >\n');
[T1,T2]=getSourceParams(app);
out=strcat(out, writeVoltageSourceCard(app,T1,1));
out=strcat(out, writeVoltageSourceCard(app,T2,2));

%output - node voltages
out=strcat(out, '/OUTPUT\n');
if outputPhaseVolt(app,1)
    out=strcat(out, writePhaseVoltProbesCard(app,1));
end
if outputPhaseVolt(app,2)
    out=strcat(out, writePhaseVoltProbesCard(app,2));
end

if outputFaultBranchVolt(app)
    out=strcat(out, writeFaultBranchVoltProbesCard(app));
end

out = strcat(out, writeCBPhaseVoltProbesCard(app));

%footer
out=strcat(out, 'BLANK MODELS\n');
out=strcat(out, 'BLANK BRANCH\n');
out=strcat(out, 'BLANK SWITCH\n');
out=strcat(out, 'BLANK SOURCE\n');
out=strcat(out, 'BLANK OUTPUT\n');
out=strcat(out, 'BLANK PLOT\n');
out=strcat(out, 'BEGIN NEW DATA CASE\n');
out=strcat(out, 'BLANK');

% DEBUG
% fid = fopen('tmp_main.atp','wt');
% fprintf(fid, out);
% fclose(fid);

end