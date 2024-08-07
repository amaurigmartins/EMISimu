function [out] = makeLCCC(app,sec)

lmodel=getLineModel(app);
 
% header
out='BEGIN NEW DATA CASE\n';
out=strcat(out,valIfTrue(app,strcmp(lmodel,'jmarti'),'JMARTI SETUP\n','LINE CONSTANTS\n'));
out=strcat(out,'$ERASE\n');

% branch
out=strcat(out,writeLCCBranchCard(app,sec));
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
thisL = all_conds(1,9);
if strcmp(lmodel,'pi')
    out=strcat(out,writePIFreqCard(app,sec,thisL),'\n');
elseif strcmp(lmodel,'bergeron')
    out=strcat(out,writeBergFreqCard(app,sec,thisL),'\n');
elseif strcmp(lmodel,'jmarti')
    out=strcat(out,writeJMartiFreqCard(app,sec,thisL),'\n');
end

% footer
out=strcat(out,'BEGIN NEW DATA CASE\n');
out=strcat(out,'BLANK CARD\n');

% This is for debug purpose:
% fid = fopen('tmp_lcc.atp','wt');
% fprintf(fid, out);
% fclose(fid);

end

