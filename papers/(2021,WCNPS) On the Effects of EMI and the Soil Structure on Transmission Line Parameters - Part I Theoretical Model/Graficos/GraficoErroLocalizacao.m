clc
clear all
close all
warning off

load('ATP_AT_L20.mat')
load('ATP_AT_L40.mat')
load('ATP_AT_L60.mat')
load('ATP_AT_L80.mat')

load('Analitico_AT_L20.mat')
load('Analitico_AT_L40.mat')
load('Analitico_AT_L60.mat')
load('Analitico_AT_L80.mat')

load('ATP_AB_L20.mat')
load('ATP_AB_L40.mat')
load('ATP_AB_L60.mat')
load('ATP_AB_L80.mat')

load('Analitico_AB_L20.mat')
load('Analitico_AB_L40.mat')
load('Analitico_AB_L60.mat')
load('Analitico_AB_L80.mat')

ini=121;
fim=197;
N=16;

m_ATP_AT_Reat_simples=[mean(ATP_AT_L20LOCReatSimples(end-N:end));mean(ATP_AT_L40LOCReatSimples(end-N:end));mean(ATP_AT_L60LOCReatSimples(end-N:end));mean(ATP_AT_L80LOCReatSimples(end-N:end))];
m_ATP_AT_TakagiSimples=[mean(ATP_AT_L20LOCTakagiSimples(end-N:end));mean(ATP_AT_L40LOCTakagiSimples(end-N:end));mean(ATP_AT_L60LOCTakagiSimples(end-N:end));mean(ATP_AT_L80LOCTakagiSimples(end-N:end))];
m_ATP_AT_TakagiModif=[mean(ATP_AT_L20LOCTakagiModif(end-N:end));mean(ATP_AT_L40LOCTakagiModif(end-N:end));mean(ATP_AT_L60LOCTakagiModif(end-N:end));mean(ATP_AT_L80LOCTakagiModif(end-N:end))];

m_Analitico_AT_Reat_simples=[mean(Analitico_AT_L20LOCReatSimples(end-N:end));mean(Analitico_AT_L40LOCReatSimples(end-N:end));mean(Analitico_AT_L60LOCReatSimples(end-N:end));mean(Analitico_AT_L80LOCReatSimples(end-N:end))];
m_Analitico_AT_TakagiSimples=[mean(Analitico_AT_L20LOCTakagiSimples(end-N:end));mean(Analitico_AT_L40LOCTakagiSimples(end-N:end));mean(Analitico_AT_L60LOCTakagiSimples(end-N:end));mean(Analitico_AT_L80LOCTakagiSimples(end-N:end))];
m_Analitico_AT_TakagiModif=[mean(Analitico_AT_L20LOCTakagiModif(end-N:end));mean(Analitico_AT_L40LOCTakagiModif(end-N:end));mean(Analitico_AT_L60LOCTakagiModif(end-N:end));mean(Analitico_AT_L80LOCTakagiModif(end-N:end))];

m_ATP_AB_Reat_simples=[mean(ATP_AB_L20LOCReatSimples(end-N:end));mean(ATP_AB_L40LOCReatSimples(end-N:end));mean(ATP_AB_L60LOCReatSimples(end-N:end));mean(ATP_AB_L80LOCReatSimples(end-N:end))];
m_ATP_AB_TakagiSimples=[mean(ATP_AB_L20LOCTakagiSimples(end-N:end));mean(ATP_AB_L40LOCTakagiSimples(end-N:end));mean(ATP_AB_L60LOCTakagiSimples(end-N:end));mean(ATP_AB_L80LOCTakagiSimples(end-N:end))];
m_ATP_AB_TakagiModif=[mean(ATP_AB_L20LOCTakagiModif(end-N:end));mean(ATP_AB_L40LOCTakagiModif(end-N:end));mean(ATP_AB_L60LOCTakagiModif(end-N:end));mean(ATP_AB_L80LOCTakagiModif(end-N:end))];

m_Analitico_AB_Reat_simples=[mean(Analitico_AB_L20LOCReatSimples(end-N:end));mean(Analitico_AB_L40LOCReatSimples(end-N:end));mean(Analitico_AB_L60LOCReatSimples(end-N:end));mean(Analitico_AB_L80LOCReatSimples(end-N:end))];
m_Analitico_AB_TakagiSimples=[mean(Analitico_AB_L20LOCTakagiSimples(end-N:end));mean(Analitico_AB_L40LOCTakagiSimples(end-N:end));mean(Analitico_AB_L60LOCTakagiSimples(end-N:end));mean(Analitico_AB_L80LOCTakagiSimples(end-N:end))];
m_Analitico_AB_TakagiModif=[mean(Analitico_AB_L20LOCTakagiModif(end-N:end));mean(Analitico_AB_L40LOCTakagiModif(end-N:end));mean(Analitico_AB_L60LOCTakagiModif(end-N:end));mean(Analitico_AB_L80LOCTakagiModif(end-N:end))];


m_ATP_AT=[m_ATP_AT_Reat_simples m_ATP_AT_TakagiSimples m_ATP_AT_TakagiModif]
m_Analitico_AT=[m_Analitico_AT_Reat_simples m_Analitico_AT_TakagiSimples m_Analitico_AT_TakagiModif]

m_ATP_AB=[m_ATP_AB_Reat_simples m_ATP_AB_TakagiSimples m_ATP_AB_TakagiModif]
m_Analitico_AB=[m_Analitico_AB_Reat_simples m_Analitico_AB_TakagiSimples m_Analitico_AB_TakagiModif]

L=200;
d=[.2;.4;.6;.8];

Dreal=L*d;

Ey_AT=abs(bsxfun(@minus,d,m_Analitico_AT));
Ex_AT=abs(bsxfun(@minus,d,m_ATP_AT));

Ey_AB=abs(bsxfun(@minus,d,m_Analitico_AB));
Ex_AB=abs(bsxfun(@minus,d,m_ATP_AB));

sz = [14 8.8];
co = get(0,'DefaultAxesColorOrder');
lso = get(0,'DefaultAxesLinestyleOrder');



set(0,'DefaultAxesLinestyleOrder',{'--','-.',':','-'});

width = sz(1) / 2.54;     % Width in cm
height = sz(2) / 2.54;    % Height in cm
alw = 1;    % AxesLineWidth
fsz = 12;      % Fontsize
lw = 2;      % LineWidth
msz = 4;       % MarkerSize


set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultAxesFontSize',fsz);
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultTextFontSize',fsz);
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultLegendFontSize',fsz);


screensize = get(0,'ScreenSize');
xpos = ceil((screensize(3)-sz(1))/2); % center the figure on the screen horizontally
ypos = ceil((screensize(4)-sz(2))/2); % center the figure on the screen vertically

fig=1;
figure(fig);
set(figure(fig), 'Position', [xpos, ypos, width*100, height*100]);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

subplot(2,2,1)
plot(t(ini:fim)*1000,Analitico_AT_L20LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L20LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L20LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(a)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 1.5*mean(m_Analitico_AT(1,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AT(1,:))),'.',','),'Color','black','FontWeight','bold');

subplot(2,2,2)
plot(t(ini:fim)*1000,Analitico_AT_L40LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L40LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L40LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(b)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 0.5*mean(m_Analitico_AT(2,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AT(2,:))),'.',','),'Color','black','FontWeight','bold');

subplot(2,2,3)
plot(t(ini:fim)*1000,Analitico_AT_L60LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L60LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L60LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(c)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 1.2*mean(m_Analitico_AT(3,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AT(3,:))),'.',','),'Color','black','FontWeight','bold');

subplot(2,2,4)
plot(t(ini:fim)*1000,Analitico_AT_L80LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L80LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,Analitico_AT_L80LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(d)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 1.2*mean(m_Analitico_AT(4,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AT(4,:))),'.',','),'Color','black','FontWeight','bold');

set(gcf,'NextPlot','add');
axes;
% h = title('Falta AT, solo uniforme, sem interferências');
set(gca,'Visible','off');
% set(h,'Visible','on');

fig=fig+1;
figure(fig);
set(figure(fig), 'Position', [xpos, ypos, width*100, height*100]);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

subplot(2,2,1)
plot(t(ini:fim)*1000,ATP_AT_L20LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L20LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L20LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(a)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 1.5*mean(m_ATP_AT(1,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AT(1,:))),'.',','),'Color','black','FontWeight','bold');

subplot(2,2,2)
plot(t(ini:fim)*1000,ATP_AT_L40LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L40LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L40LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(b)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 0.6*mean(m_ATP_AT(2,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AT(2,:))),'.',','),'Color','black','FontWeight','bold');

subplot(2,2,3)
plot(t(ini:fim)*1000,ATP_AT_L60LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L60LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L60LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(c)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 1.2*mean(m_ATP_AT(3,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AT(3,:))),'.',','),'Color','black','FontWeight','bold');

subplot(2,2,4)
plot(t(ini:fim)*1000,ATP_AT_L80LOCReatSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L80LOCTakagiSimples(ini:fim),'.-',...
    t(ini:fim)*1000,ATP_AT_L80LOCTakagiModif(ini:fim),'.-',...
    'LineWidth',lw,'MarkerSize',msz);
xlim([t(ini)*1000 t(fim)*1000])
ylim([-0.1 1])
grid on;
xlabel('(d)');
legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')
text(.8*t(fim)*1000, 0.8*mean(m_ATP_AT(4,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AT(4,:))),'.',','),'Color','black','FontWeight','bold');

set(gcf,'NextPlot','add');
axes;
% h = title('Falta AT, solo estratificado, com interferências');
set(gca,'Visible','off');
% set(h,'Visible','on');
% 
% fig=fig+1;
% figure(fig);
% set(figure(fig), 'Position', [xpos, ypos, width*100, height*100]);
% set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
% 
% subplot(2,2,1)
% plot(t(ini:fim)*1000,Analitico_AB_L20LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L20LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L20LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(a)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 1.6*mean(m_Analitico_AB(1,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AB(1,:))),'.',','),'Color','black','FontWeight','bold');
% 
% subplot(2,2,2)
% plot(t(ini:fim)*1000,Analitico_AB_L40LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L40LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L40LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(b)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 0.6*mean(m_Analitico_AB(2,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AB(2,:))),'.',','),'Color','black','FontWeight','bold');
% 
% subplot(2,2,3)
% plot(t(ini:fim)*1000,Analitico_AB_L60LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L60LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L60LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(c)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 1.2*mean(m_Analitico_AB(3,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AB(3,:))),'.',','),'Color','black','FontWeight','bold');
% 
% subplot(2,2,4)
% plot(t(ini:fim)*1000,Analitico_AB_L80LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L80LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,Analitico_AB_L80LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(d)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 0.8*mean(m_Analitico_AB(4,:)), strrep(sprintf('m = %2.2f km', L*mean(m_Analitico_AB(4,:))),'.',','),'Color','black','FontWeight','bold');
% 
% set(gcf,'NextPlot','add');
% axes;
% h = title('Falta AB, solo uniforme, sem interferências');
% set(gca,'Visible','off');
% set(h,'Visible','on');
% 
% 
% fig=fig+1;
% figure(fig);
% set(figure(fig), 'Position', [xpos, ypos, width*100, height*100]);
% set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
% 
% subplot(2,2,1)
% plot(t(ini:fim)*1000,ATP_AB_L20LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L20LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L20LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(a)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 1.6*mean(m_ATP_AB(1,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AB(1,:))),'.',','),'Color','black','FontWeight','bold');
% 
% subplot(2,2,2)
% plot(t(ini:fim)*1000,ATP_AB_L40LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L40LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L40LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(b)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 0.6*mean(m_ATP_AB(2,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AB(2,:))),'.',','),'Color','black','FontWeight','bold');
% 
% subplot(2,2,3)
% plot(t(ini:fim)*1000,ATP_AB_L60LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L60LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L60LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(c)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 1.2*mean(m_ATP_AB(3,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AB(3,:))),'.',','),'Color','black','FontWeight','bold');
% 
% subplot(2,2,4)
% plot(t(ini:fim)*1000,ATP_AB_L80LOCReatSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L80LOCTakagiSimples(ini:fim),'.-',...
%     t(ini:fim)*1000,ATP_AB_L80LOCTakagiModif(ini:fim),'.-',...
%     'LineWidth',lw,'MarkerSize',msz);
% xlim([t(ini)*1000 t(fim)*1000])
% ylim([-0.1 1])
% grid on;
% xlabel('(d)');
% legend('Reactance',...
%     'Takagi',...
%     'Modified Takagi',...
%     'Location','Best')
% text(.8*t(fim)*1000, 0.8*mean(m_ATP_AB(4,:)), strrep(sprintf('m = %2.2f km', L*mean(m_ATP_AB(4,:))),'.',','),'Color','black','FontWeight','bold');
% 
% set(gcf,'NextPlot','add');
% axes;
% h = title('Falta AB, solo estratificado, com interferências');
% set(gca,'Visible','off');
% set(h,'Visible','on');

sz = [8.8 8.8];
width = sz(1) / 2.54;     % Width in cm
height = sz(2) / 2.54;    % Height in cm

fig=fig+1;
figure(fig);

set(figure(fig), 'Position', [xpos, ypos, width*100, height*100]);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
scatter(L*Ex_AT(:,1),L*Ey_AT(:,1),'o','filled','LineWidth',lw);hold all;
scatter(L*Ex_AT(:,2),L*Ey_AT(:,2),'^','filled','LineWidth',lw);
scatter(L*Ex_AT(:,3),L*Ey_AT(:,3),'d','filled','LineWidth',lw)

plot([0 25],[0 25],'b-')

text(.5+L*Ex_AT(1,1), 1.1*L*Ey_AT(1,1), strrep(sprintf('m = %2.0f%%', 100*d(1,1)),'.',','),'Color','black','FontWeight','bold');
text(.5+L*Ex_AT(2,1), 1.1*L*Ey_AT(2,1), strrep(sprintf('m = %2.0f%%', 100*d(2,1)),'.',','),'Color','black','FontWeight','bold');
text(.5+L*Ex_AT(3,1), 1.1*L*Ey_AT(3,1), strrep(sprintf('m = %2.0f%%', 100*d(3,1)),'.',','),'Color','black','FontWeight','bold');
text(.5+L*Ex_AT(4,1), 1.1*L*Ey_AT(4,1), strrep(sprintf('m = %2.0f%%', 100*d(4,1)),'.',','),'Color','black','FontWeight','bold');


axis([0 25 0 25]);
axis equal;
grid on;
box on;
ylabel('Stratified soil, with interferences (km)');
xlabel('Uniform soil, no interferences (km)');
figure(fig);xlim([0,25])
set(gca,'XTick',[0:5:25])
set(gca,'YTick',[0:5:25])

legend('Reactance',...
    'Takagi',...
    'Modified Takagi',...
    'Location','Best')

set(gcf,'NextPlot','add');
axes;
% h = title('Erro absoluto - Falta AT');
set(gca,'Visible','off');
% set(h,'Visible','on');
