function [out] = writeFaultModels(app)

anginc=app.Faultincidenceangle.Value;
ftype=getFaultType(app);
freq=app.Freq.Value;
npre=app.Cyclesbeforefault.Value;

out=[];

out=strcat(out,'/MODELS\n');
out=strcat(out,'MODELS\n');
out=strcat(out,'INPUT\n');
out=strcat(out,'  MM0001 {v(F_INA)}\n');
out=strcat(out,'  MM0002 {v(F_INB)}\n');
out=strcat(out,'  MM0003 {v(F_INC)}\n');
out=strcat(out,'OUTPUT\n');
out=strcat(out,'  CHA\n');
out=strcat(out,'  CHB\n');
out=strcat(out,'  CHC\n');
out=strcat(out,'  CHT\n');
out=strcat(out,'MODEL modfalta\n');
out=strcat(out,'INPUT\n');
out=strcat(out,'    VFa\n');
out=strcat(out,'    VFb\n');
out=strcat(out,'    VFc\n');
out=strcat(out,'DATA\n');
out=strcat(out,'    anginc\n');
out=strcat(out,'    tipo\n');
out=strcat(out,'    f\n');
out=strcat(out,'    npre\n');
out=strcat(out,'OUTPUT\n');
out=strcat(out,'    swFa\n');
out=strcat(out,'    swFb\n');
out=strcat(out,'    swFc\n');
out=strcat(out,'    swT\n');
out=strcat(out,'VAR\n');
out=strcat(out,'    dVa\n');
out=strcat(out,'    dVb\n');
out=strcat(out,'    dVc\n');
out=strcat(out,'    dVab\n');
out=strcat(out,'    dVbc\n');
out=strcat(out,'    dVca\n');
out=strcat(out,'    bVa[1..2]\n');
out=strcat(out,'    bVb[1..2]\n');
out=strcat(out,'    bVc[1..2]\n');
out=strcat(out,'    bVab[1..2]\n');
out=strcat(out,'    bVbc[1..2]\n');
out=strcat(out,'    bVca[1..2]\n');
out=strcat(out,'    bt[1..2]\n');
out=strcat(out,'    swFa\n');
out=strcat(out,'    swFb\n');
out=strcat(out,'    swFc\n');
out=strcat(out,'    swT\n');
out=strcat(out,'    contSWA\n');
out=strcat(out,'    contSWB\n');
out=strcat(out,'    contSWC\n');
out=strcat(out,'    contSWT\n');
out=strcat(out,'    flagSWA\n');
out=strcat(out,'    flagSWB\n');
out=strcat(out,'    flagSWC\n');
out=strcat(out,'    flagSWT\n');
out=strcat(out,'    faux\n');
out=strcat(out,'INIT\n');
out=strcat(out,'    dVa:=0\n');
out=strcat(out,'    dVb:=0\n');
out=strcat(out,'    dVc:=0\n');
out=strcat(out,'    dVab:=0\n');
out=strcat(out,'    dVbc:=0\n');
out=strcat(out,'    dVca:=0\n');
out=strcat(out,'    bVa[1..2]:=0\n');
out=strcat(out,'    bVb[1..2]:=0\n');
out=strcat(out,'    bVc[1..2]:=0\n');
out=strcat(out,'    bVab[1..2]:=0\n');
out=strcat(out,'    bVbc[1..2]:=0\n');
out=strcat(out,'    bVca[1..2]:=0\n');
out=strcat(out,'    swFa:=0.0\n');
out=strcat(out,'    swFb:=0.0\n');
out=strcat(out,'    swFc:=0.0\n');
out=strcat(out,'    swT:=0.0\n');
out=strcat(out,'    contSWA:=0.0\n');
out=strcat(out,'    contSWB:=0.0\n');
out=strcat(out,'    contSWC:=0.0\n');
out=strcat(out,'    contSWT:=0.0\n');
out=strcat(out,'    flagSWA:=0.0\n');
out=strcat(out,'    flagSWB:=0.0\n');
out=strcat(out,'    flagSWC:=0.0\n');
out=strcat(out,'    flagSWT:=0.0\n');
out=strcat(out,'    faux:=0.0\n');
out=strcat(out,'ENDINIT\n');
out=strcat(out,'EXEC\n');
out=strcat(out,'    bVa[1] := bVa[2]\n');
out=strcat(out,'    bVb[1] := bVb[2]\n');
out=strcat(out,'    bVc[1] := bVc[2]\n');
out=strcat(out,'    bVab[1] := bVab[2]\n');
out=strcat(out,'    bVbc[1] := bVbc[2]\n');
out=strcat(out,'    bVca[1] := bVca[2]\n');
out=strcat(out,'\n');
out=strcat(out,'    bVa[2] := VFa\n');
out=strcat(out,'    bVb[2] := VFb\n');
out=strcat(out,'    bVc[2] := VFc\n');
out=strcat(out,'    bVab[2] := VFa-VFb\n');
out=strcat(out,'    bVbc[2] := VFb-VFc\n');
out=strcat(out,'    bVca[2] := VFc-VFa\n');
out=strcat(out,'\n');
out=strcat(out,'    dVa:=(bVa[2] - bVa[1])/timestep\n');
out=strcat(out,'    dVb:=(bVb[2] - bVb[1])/timestep\n');
out=strcat(out,'    dVc:=(bVc[2] - bVc[1])/timestep\n');
out=strcat(out,'    dVab:=dVa-dVb\n');
out=strcat(out,'    dVbc:=dVb-dVc\n');
out=strcat(out,'    dVca:=dVc-dVa\n');
out=strcat(out,'\n');
out=strcat(out,'IF (tipo=1) AND (dVa>0) AND (bVa[2]*bVa[1]<0) AND (t>=npre/f) AND (faux=0) THEN\n');
out=strcat(out,'        flagSWA:=1.0\n');
out=strcat(out,'        flagSWT:=1.0\n');
out=strcat(out,'        faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=2) AND (dVb>0) AND (bVb[2]*bVb[1]<0) AND (t>=npre/f) AND (faux=0) THEN\n');
out=strcat(out,'        flagSWB:=1.0\n');
out=strcat(out,'        flagSWT:=1.0\n');
out=strcat(out,'        faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=3) AND (dVc>0) AND (bVc[2]*bVc[1]<0) AND (t>=npre/f) AND (faux=0) THEN\n');
out=strcat(out,'        flagSWC:=1.0\n');
out=strcat(out,'        flagSWT:=1.0\n');
out=strcat(out,'        faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=4) AND (dVab>0) AND (bVab[2]*bVab[1]<0) AND (t>=npre/f) AND (faux=0) \n');
out=strcat(out,'THEN\n');
out=strcat(out,'        flagSWA:=1.0\n');
out=strcat(out,'        flagSWB:=1.0\n');
out=strcat(out,' faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=5) AND (dVbc>0) AND (bVbc[2]*bVbc[1]<0) AND (t>=npre/f) AND (faux=0) \n');
out=strcat(out,'THEN\n');
out=strcat(out,'        flagSWB:=1.0\n');
out=strcat(out,'        flagSWC:=1.0\n');
out=strcat(out,' faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=6) AND (dVca>0) AND (bVca[2]*bVca[1]<0) AND (t>=npre/f) AND (faux=0) \n');
out=strcat(out,'THEN\n');
out=strcat(out,'        flagSWC:=1.0\n');
out=strcat(out,'        flagSWA:=1.0\n');
out=strcat(out,' faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=7) AND (dVab>0) AND (bVab[2]*bVab[1]<0) AND (t>=npre/f) AND (faux=0) \n');
out=strcat(out,'THEN\n');
out=strcat(out,'        flagSWA:=1.0\n');
out=strcat(out,'        flagSWB:=1.0\n');
out=strcat(out,'        flagSWT:=1.0\n');
out=strcat(out,' faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=8) AND (dVbc>0) AND (bVbc[2]*bVbc[1]<0) AND (t>=npre/f) AND (faux=0) \n');
out=strcat(out,'THEN\n');
out=strcat(out,'        flagSWB:=1.0\n');
out=strcat(out,'        flagSWC:=1.0\n');
out=strcat(out,'        flagSWT:=1.0\n');
out=strcat(out,' faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=9) AND (dVca>0) AND (bVca[2]*bVca[1]<0) AND (t>=npre/f) AND (faux=0) \n');
out=strcat(out,'THEN\n');
out=strcat(out,'        flagSWC:=1.0\n');
out=strcat(out,'        flagSWA:=1.0\n');
out=strcat(out,'        flagSWT:=1.0\n');
out=strcat(out,' faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=10) AND (dVa>0) AND (bVa[2]*bVa[1]<0) AND (t>=npre/f) AND (faux=0) THEN\n');
out=strcat(out,'        flagSWA:=1.0\n');
out=strcat(out,'        flagSWB:=1.0\n');
out=strcat(out,'        flagSWC:=1.0\n');
out=strcat(out,'        faux:=1.0\n');
out=strcat(out,'ENDIF\n');
out=strcat(out,'IF (tipo=11) AND (dVa>0) AND (bVa[2]*bVa[1]<0) AND (t>=npre/f) AND (faux=0) THEN\n');
out=strcat(out,'        flagSWA:=1.0\n');
out=strcat(out,'        flagSWB:=1.0\n');
out=strcat(out,'        flagSWC:=1.0\n');
out=strcat(out,'        flagSWT:=1.0\n');
out=strcat(out,'        faux:=1.0\n');
out=strcat(out,'ENDIF    \n');
out=strcat(out,'\n');
out=strcat(out,'    IF (flagSWA=1) THEN\n');
out=strcat(out,'        contSWA:=contSWA+1.0\n');
out=strcat(out,'    ENDIF\n');
out=strcat(out,'    IF (flagSWB=1) THEN\n');
out=strcat(out,'        contSWB:=contSWB+1.0\n');
out=strcat(out,'    ENDIF\n');
out=strcat(out,'    IF (flagSWC=1) THEN\n');
out=strcat(out,'        contSWC:=contSWC+1.0\n');
out=strcat(out,'    ENDIF\n');
out=strcat(out,'    IF (flagSWT=1) THEN\n');
out=strcat(out,'        contSWT:=contSWT+1.0\n');
out=strcat(out,'    ENDIF\n');
out=strcat(out,'    \n');
out=strcat(out,'    IF contSWA*timestep>=(anginc/(360*f)) THEN \n');
out=strcat(out,'        swFa:=1\n');
out=strcat(out,'    ENDIF    \n');
out=strcat(out,'    IF contSWB*timestep>=(anginc/(360*f)) THEN \n');
out=strcat(out,'        swFb:=1\n');
out=strcat(out,'    ENDIF   \n');
out=strcat(out,'    IF contSWC*timestep>=(anginc/(360*f)) THEN \n');
out=strcat(out,'        swFc:=1\n');
out=strcat(out,'    ENDIF   \n');
out=strcat(out,'    IF contSWT*timestep>=(anginc/(360*f)) THEN \n');
out=strcat(out,'        swT:=1\n');
out=strcat(out,'    ENDIF       \n');
out=strcat(out,'ENDEXEC\n');
out=strcat(out,'ENDMODEL\n');
out=strcat(out,'USE MODFALTA AS modFalta\n');
out=strcat(out,'INPUT\n');
out=strcat(out,'  VFa:= MM0001\n');
out=strcat(out,'  VFb:= MM0002\n');
out=strcat(out,'  VFc:= MM0003\n');
out=strcat(out,'DATA\n');
out=strcat(out,strcat('  anginc:= ',modprin(8,anginc),'\n'));
out=strcat(out,strcat('  tipo:= ',modprin(8,ftype),'\n'));
out=strcat(out,strcat('  f:= ',modprin(8,freq),'\n'));
out=strcat(out,strcat('  npre:= ',modprin(8,npre),'\n'));
out=strcat(out,'OUTPUT\n');
out=strcat(out,'  CHA:=swFa\n');
out=strcat(out,'  CHB:=swFb\n');
out=strcat(out,'  CHC:=swFc\n');
out=strcat(out,'  CHT:=swT\n');
out=strcat(out,'ENDUSE\n');
out=strcat(out,'RECORD\n');
out=strcat(out,'  modFalta.swFa AS swFa\n');
out=strcat(out,'  modFalta.swFb AS swFb\n');
out=strcat(out,'  modFalta.swFc AS swFc\n');
out=strcat(out,'  modFalta.swT AS swT\n');
out=strcat(out,'ENDMODELS\n');

end