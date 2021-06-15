function [out] = writeLCCConductorCard(app,con)
out=blanks(80);
%         1         2         3         4         5         6         7         8
%12345678901234567890123456789012345678901234567890123456789012345678901234567890
%C >SKIN>RESIS  >I>REACT  >DIAM   >HORIZ  >VTOWER >VMID   >SEPAR  >ALPHA>      NB
out(1:3)=sprintf('%3d',con(1));
out(4:8)=modprin(5,con(2));
out(9:16)=modprin(8,con(3));
out(17:18)=sprintf('%2d',con(4));
out(27:34)=modprin(8,con(5));
out(35:42)=modprin(8,con(6));
out(43:50)=modprin(8,con(7));
out(51:58)=modprin(8,con(8));
end