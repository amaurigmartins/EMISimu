function out = writeThEqCard(app,src_data,thisterm)

out=[];
seq='ABC';
num_src=size(src_data,1);
cod=[51 52 53];

for i=1:num_src
    tmp_out=blanks(80);
    r0=src_data(i,1);
    l0=src_data(i,2);
    r1=src_data(i,3);
    l1=src_data(i,4);
    RR=[r0 r1 0];
    LL=[l0 l1 0];
    for j=1:3
        tmp_out(1:2)=sprintf('%2d',cod(j));
        tmp_out(3:8)=sprintf('VS%dT%d%s',i,thisterm,seq(j));
        tmp_out(9:14)=sprintf('TH%dT%d%s',i,thisterm,seq(j));
        tmp_out(27:32)=modprin(6,RR(j));
        tmp_out(33:44)=modprin(12,LL(j));
        out=strcat(out,tmp_out,'\n');
    end
end

end