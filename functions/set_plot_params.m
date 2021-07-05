lw=1.8;
k_scaling = 1.5; %1.5          % scaling factor of the figure
fnt_scaling = 1;          % scaling factor of the figure
% (You need to plot a figure which has a width of (8.8 * k_scaling)
% in MATLAB, so that when you paste it into your paper, the width will be
% scalled down to 8.8 cm  which can guarantee a preferred clearness.
k_width_height = 1.8;%1.8;      % width:height ratio of the figure
width = 8.8 * k_scaling;
height = width / k_width_height;
% top = .8;  % normalized top margin
% bottom = 1.5;	% normalized bottom margin
% left = 1;	% normalized left margin
% right = .8;  % normalized right margin

top = .8;  % normalized top margin
bottom = 1.3;	% normalized bottom margin
left = 1.5;	% normalized left margin
right = .4;  % normalized right margin

set(0,'defaultFigureUnits','centimeters');
set(0,'defaultFigurePosition',[0 0 width height]);
set(0,'defaultLineLineWidth',1*k_scaling);
set(0,'defaultAxesLineWidth',0.25*k_scaling);
set(0,'defaultAxesGridLineStyle',':');
set(0,'defaultAxesYGrid','on');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultAxesFontSize',12*fnt_scaling);
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultTextFontSize',12*fnt_scaling);
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultLegendFontSize',12*fnt_scaling);
set(0,'defaultAxesUnits','normalized');
set(0,'defaultAxesPosition',[left/width bottom/height (width-left-right)/width  (height-bottom-top)/height]);
% set(0,'defaultAxesColorOrder',[0 0 0]);
    set(0,'DefaultAxesColorOrder','remove')
    set(0,'DefaultAxesColorOrder',get(0,'FactoryAxesColorOrder'))
    set(0,'defaultAxesLineStyleOrder','remove')
    set(0,'defaultAxesLineStyleOrder',get(0,'FactoryAxesLineStyleOrder'))
set(0,'defaultAxesLineStyleOrder','-')
set(0,'defaultAxesTickDir','out');
set(0,'defaultFigurePaperPositionMode','auto');
set(0,'defaultLegendLocation','best');
set(0,'defaultLegendBox','on');
set(0,'defaultLegendOrientation','vertical');