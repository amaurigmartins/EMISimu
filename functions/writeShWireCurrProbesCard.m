function out = writeShWireCurrProbesCard(app,sec, status, fault_sec)

if sec <= fault_sec
    in2=3;
    en2=8;
    in1=9;
    en1=14;
else
    in1=3;
    en1=8;
    in2=9;
    en2=14;
end

out=blanks(80);
out(in1:en1)=sprintf('0%04dM',sec);
out(in2:en2)=sprintf('0%04d ',sec);
out(55:63)='MEASURING';
out(80)=sprintf('%d',status);
out=strcat(out,'\n');


end