function [out] = makeLCCC(app,sec)

lmodel=getLineModel(app);

% header
out='BEGIN NEW DATA CASE\n';
out=strcat(out,valIfTrue(app,strcmp(lmodel,'jmarti'),'JMARTI SETUP\n','LINE CONSTANTS\n'));
out=strcat(out,'$ERASE\n');

% branch
out=strcat(out,writeLCCBranchCard(app,sec),'\n');
if strcmp(lmodel,'jmarti')
    out=strcat(out,'LINE CONSTANTS\n');
end
out=strcat(out,'METRIC\n');

% conductor
all_conds=parseAttSetData(app,sec);
nc=size(all_conds,1);
for i=1:nc
    con=all_conds(i,:);
    out=strcat(out,writeLCCConductorCard(app,con),'\n');
end
out=strcat(out,'BLANK CARD ENDING CONDUCTOR CARDS\n');

% frequency
if strcmp(lmodel,'pi')
    out=strcat(out,writePIFreqCard(app,sec),'\n');
elseif strcmp(lmodel,'bergeron')
    out=strcat(out,writeBergFreqCard(app,sec),'\n');
elseif strcmp(lmodel,'jmarti')
    out=strcat(out,writeJMartiFreqCard(app,sec),'\n');
end

% footer
out=strcat(out,'BEGIN NEW DATA CASE\n');
out=strcat(out,'BLANK CARD\n');

fid = fopen('tmp_lcc.atp','wt');
fprintf(fid, out);
fclose(fid);

end

