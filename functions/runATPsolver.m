function [out] = runATPsolver(spath,wdir,fname)

if contains(spath,'runatp.exe','IgnoreCase',true)
    cmd=['"' spath '" ' '"' fullfile(wdir,fname) '"'];
% elseif contains(spath,'tpbig.exe','IgnoreCase',true)
%     % need to write a startup file first
%     fid = fopen(fullfile(wdir,'startup'),'wt');
%     str=           '1  RHIGH  EPSZNO  EPWARN  EPSTOP  EPSUBA  EPDGEL  EPOMEG   SZPLT   SZBED  TENFLZ\n';
%     str=strcat(str,'  1.D+10   1.D-8   1.D-3     0.1    100.  1.D-16  1.D-15    10.0    72.0     10.\n');
%     str=strcat(str,'2 SIGMAX  TENERG  DEGMIN  DEGMAX  ZNOLIM(1), (2)  STATFR  ZNVREF  XMAXMX   AINCR\n');
%     str=strcat(str,'     4.0  1.D+20     0.0    360.     1.0     1.5    60.0   1.D-6     2.0     .05\n');
%     str=strcat(str,'3 FREQFR  HLETT1  HLETT2     VHS      VS      VH  TAXISL  VAXISL   FILL1   FILL2\n');
%     str=strcat(str,'            0.25             8.0     1.0     10.    20.0     8.0      6.     7.0\n');
%     str=strcat(str,'4 TOLRCE   FHTAX   FXSUP   FYSUP   FXTIT   FYTIT  VPLOTS  VPLOTL  FACTVI  FTCARR\n');
%     str=strcat(str,'   8.E-5     0.5     .25     .03    0.10     0.1     1.0     5.0     0.0     1.5\n');
%     str=strcat(str,'5 FXNUMV  FXNUMH  FVAXTT  FXVERT  UNIXON  TIMTAC  OVRLAP  FLZERO  EPSILN  FLTINF\n');
%     str=strcat(str,'     1.5     5.0    -1.5     0.0     0.0     0.0     0.5  1.D-12   1.D-8  1.D+19\n');
%     str=strcat(str,'6 XHEADM  YHEADM  HGTHDM  XCASTI  YCASTI  HGTCST  XLEGND  YLEGND  HGTLGN  TSTALL\n');
%     str=strcat(str,'     2.5    7.95     .55     0.5     7.3     .35     0.5    1.30     .25     0.0\n');
%     str=strcat(str,'7 XALPHA  YALPHA  HGTALF  D4FACT  PEKEXP  EPSLRT  EPSPIV  PLMARK  FACOSC  UMJBUS\n');
%     str=strcat(str,'     1.5     6.5     .25     0.0     43.  1.E-12  1.E-16     1.0     0.3        \n');
%     str=strcat(str,'8 NMAUTO  INTINF  KOL132  MUNIT5  MAXZNO  IPRSPY  IPRSUP   LNPIN  MINHAR  MAXHAR\n');
%     str=strcat(str,'       1 9999999     132       1      50       0       0       6       0      20\n');
%     str=strcat(str,'9 NFORS2  NIOMAX    MRGN  LINLIM   MPAGE  MODE28  KPGRID KPEN(1) KPEN(2) KPEN(3)\n');
%     str=strcat(str,'      30      10       2     100       0       1       3      12      10      11\n');
%     str=strcat(str,'10 ..(4)  KOMLEV   NSMTH  MODSCR  KOLALP  MAXFLG  LIMCRD  NOBLAN  MOUSET  NOTPPL\n');
%     str=strcat(str,'      14      -1      50       2       5       1    5500       0       0       1\n');
%     str=strcat(str,'1 NOCOMM  NOHELP  NEWPL4  JDELAY  NOTMAX  NSMPLT  KOLWID  KOLSEP  JCOLU1  KSLOWR\n');
%     str=strcat(str,'       1       0       0       0       0      50      11       1       0      25\n');
%     str=strcat(str,'2 KSYMBL  NOBACK  KOLEXM    LTEK   NCUT1   NCUT2  INCHPX  INCHPY  NODPCX  LCHLIM\n');
%     str=strcat(str,'      50       1      60       1      13      11       2       2       0       0\n');
%     str=strcat(str,'13 NORUN  JTURBO  MAXSYM     IHS  LIMCOL   KLEVL   KEXTR  NOHPGL  NOPOST  NOSM59\n');
%     str=strcat(str,'       0       5       3       3      79       0       0       0       0       0\n');
%     str=strcat(str,'4 LEFTA6  LENREC  LU6VRT   LRLIM  KASEND  LUNDAT  KTRPL4  JORIEN  LIMPNL  LUNTEX\n');
%     str=strcat(str,'       0       0   32768      75       5       3   -6666       0     200     -11\n');
%     str=strcat(str,'5 KINSEN  LISTON  LIMTAC  NOCALC  MFLUSH  L4BYTE  KOMPAR  LIST01   NOGNU  KROSEC\n');
%     str=strcat(str,'       1       0      25       0    1000       1       4       0       0       0\n');
%     str=strcat(str,'6 LUNIT1  LUNIT2  LUNIT3  LUNIT4  LUNIT5  LUNIT6  LUNIT7  LUNIT8  LUNIT9  LUNT10\n');
%     str=strcat(str,'      21      22       3      -4       1       6       7       8       9      10\n');
%     str=strcat(str,'17 KS(1)   KS(2)   KS(3)   KS(4)   KP(1)   KP(2)   KP(3)   KP(4)  KOLROV  NUMHLD\n');
%     str=strcat(str,'       0       0      12      10       7      14       0       0      18        \n');
%     str=strcat(str,'8 L4FULL  NOQUOT  JJEATS  NUMBUS   NOTAB  NOPISA   MSCSV  MAXL31  LIM132  MAXMVC\n');
%     str=strcat(str,'       0       0       0      -1       1       0       0     400       0      80\n');
%     str=strcat(str,'18 Name of language font file  ] Window] Root name for SPY @K usage    ]        \n');
%     str=strcat(str,'blockd51.bin                    junk    inclspy .dat                            \n');
%     str=strcat(str,'9 SSONLY  CHEFLD  TEXNAM  CHVBAR  BRANCH  TXCOPY  USERID  -TRASH  -TERRA  CHRCOM\n');
%     str=strcat(str,'  PHASOR  E       DUM     |       NAME    COPY    Hannov  ......  TERRA   C {}$,\n');
%     str=strcat(str,'0 DATTYP  LISTYP  PCHTYP  PL4TYP  EFIELD  FMTPL4  PSCTYP  DBGTYP  BINTYP  EXTTYP\n');
%     str=strcat(str,'  .dat    .lis    .pch    .pl4                    .ps     .dbg    .bin    .ext  \n');
%     str=strcat(str,'$EOF    { Software end-of-file terminates last of 20 or fewer VMS-like symbols  \n');
%     fprintf(fid, str);
%     fclose(fid);
%     
% %         cmd=['start "Running ATP solver..." "' spath '" disk ' '"' fullfile(wdir,fname) '" s -r'];
%     cmd=['"' spath '" disk ' '"' fullfile(wdir,fname) '" s -r'];
end

fprintf('Calling the ATP solver to process file %s...\n',fname);
out=system(cmd);

%clean the mess
orig_state = warning;warning('off','all');

[~,fstr,~] = fileparts(fname);
if exist(fullfile(wdir,[fstr '.pch']),'file')==2 || exist(fullfile(wdir,[fstr '.pl4']),'file')==2
%     delete(fullfile(wdir,'startup'));
    delete(fullfile(wdir,'*.bin'));
    delete(fullfile(wdir,[fstr '.dbg']));
    delete(fullfile(wdir,[fstr '.lis']));
%     delete(fullfile(wdir,[fstr '.atp']));
    delete(fullfile(wdir,'*.tmp'));
    delete(fullfile(wdir,'*.000'));
    delete(fullfile(wdir,'*.gnu'));
end
warning(orig_state);

end

