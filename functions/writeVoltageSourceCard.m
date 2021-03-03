function out = writeVoltageSourceCard(app,src_data,thisterm)

out=[];
seq='ABC';
num_src=size(src_data,1);

for i=1:num_src
    tmp_out=blanks(80);
    amp=src_data(i,1);
    freq=src_data(i,2);
    ang=src_data(i,3)+[0 -120 -240];
    tstart=src_data(i,4);
    tstop=src_data(i,5);
    
    for j=1:3
        tmp_out(1:2)=sprintf('%2d',14);
        tmp_out(3:8)=sprintf('VS%dT%d%s',i,thisterm,seq(j));
        tmp_out(11:20)=modprin(app,10,amp);
        tmp_out(21:30)=modprin(app,10,freq);
        tmp_out(31:40)=modprin(app,10,ang(j));
        tmp_out(61:70)=modprin(app,10,tstart);
        tmp_out(71:80)=modprin(app,10,tstop);
        out=strcat(out,tmp_out,'\n');
    end
end

end