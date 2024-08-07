function out = writeFaultBranchConnections(app,fault_sec)

fault_type = getFaultType(app);
measure_status=valIfTrue(app,app.Faultbranchphasecurrents.Value,1,0);
circ_fault=valIfTrue(app, strcmp(app.Faultedcircuit.SelectedObject.Text,'Circuit 1'),1,2);
seq='ABC';

out1='13F_INC RFC                                                           CHC      0\n';
out1=strcat(out1, '13F_INB RFB                                                           CHB      0\n');
out1=strcat(out1, '13F_INA RFA                                                           CHA      0\n');
out1=strcat(out1, '13RFC   RG_C                                                          CHT      0\n');
out1=strcat(out1, '13RFB   RG_B                                                          CHT      0\n');
out1=strcat(out1, '13RFA   RG_A                                                          CHT      0\n');

out2=blanks(80);
out2(3:8)=sprintf('%d%04d%s',circ_fault,fault_sec,seq(1));
out2(9:13)='F_INA';
if fault_type ~= 0 % permanent regime (None fault)
    out2(55:63)='MEASURING';
    out2(80)=sprintf('%d',measure_status);
else
    out2(15:24)='      1.E3';
    out2(80)='0';
end

out3=blanks(80);
out3(3:8)=sprintf('%d%04d%s',circ_fault,fault_sec,seq(2));
out3(9:13)='F_INB';
if fault_type ~= 0 % permanent regime (None fault)
    out3(55:63)='MEASURING';
    out3(80)=sprintf('%d',measure_status);
else
    out3(15:24)='      1.E3';
    out3(80)='0';
end

out4=blanks(80);
out4(3:8)=sprintf('%d%04d%s',circ_fault,fault_sec,seq(3));
out4(9:13)='F_INC';
if fault_type ~= 0 % permanent regime (None fault)
    out4(55:63)='MEASURING';
    out4(80)=sprintf('%d',measure_status);
else
    out4(15:24)='      1.E3';
    out4(80)='0';
end

out5=blanks(80);
out5(3:8)='FGOUTA';
out5(9:13)=sprintf('0%04d',fault_sec);
out5(55:63)='MEASURING';
out5(80)=sprintf('%d',measure_status);

out6=blanks(80);
out6(3:8)='FGOUTB';
out6(9:13)=sprintf('0%04d',fault_sec);
out6(55:63)='MEASURING';
out6(80)=sprintf('%d',measure_status);

out7=blanks(80);
out7(3:8)='FGOUTC';
out7(9:13)=sprintf('0%04d',fault_sec);
out7(55:63)='MEASURING';
out7(80)=sprintf('%d',measure_status);

out=strcat(out1,out2,'\n',out3,'\n',out4,'\n',out5,'\n',out6,'\n',out7,'\n');

end