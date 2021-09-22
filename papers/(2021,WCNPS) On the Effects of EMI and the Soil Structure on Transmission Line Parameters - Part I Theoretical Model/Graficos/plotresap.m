function [ ] = plotresap( a_m, rho_m, x, meas)

xx = 0:.25:max(a_m);
yy = interp1(a_m,rho_m,xx, 'pchip');

cam=(length(x)+1)/2;
a=0:1:max(a_m)*1.25;
rho_aparente=resap([x(1:cam)], [x((cam+1):length(x))], a);
tmp_ind = zeros(1,floor(length(x)/2));



for j = cam+1:length(x)
    tmp_ind(j-cam) = sum(x(cam+1:j));
end

lw = 1.5;      % LineWidth
msz = 6;       % MarkerSize

fig=1;
figure(fig)
clf
% plot(a_m, meas(:,1), 'o','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',lw,'MarkerSize',3,'DisplayName','Measured')
% hleg = legend('-DynamicLegend', 'Location', 'Best' );
% plot(a_m, rho_m, '^','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',lw,'MarkerSize',msz,'DisplayName','Trimmed mean');hold all;
% plot(a_m, meas(:,2), 'o','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',lw,'MarkerSize',3,'DisplayName','Measured')
% hleg = legend('-DynamicLegend', 'Location', 'Best' );
% plot(a_m, meas(:,3), 'o','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',lw,'MarkerSize',3,'DisplayName','Measured')
% hleg = legend('-DynamicLegend', 'Location', 'Best' );
% hleg.String(end)=[];
% plot(a_m, meas(:,4), 'o','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',lw,'MarkerSize',3,'DisplayName','Measured')
% hleg = legend('-DynamicLegend', 'Location', 'Best' );
% hleg.String(end)=[];
% plot(a_m, meas(:,5), 'o','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',lw,'MarkerSize',3,'DisplayName','Measured')
% hleg = legend('-DynamicLegend', 'Location', 'Best' );
% hleg.String(end)=[];
% plot(a_m, meas(:,6), 'o','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',lw,'MarkerSize',3,'DisplayName','Measured')
% hleg = legend('-DynamicLegend', 'Location', 'Best' );
% hleg.String(end)=[];
plot(a,rho_aparente,'-','LineWidth',lw,'MarkerSize',msz,'DisplayName','Computed');hold all;
stairs([0 tmp_ind max(a_m)*1.25],[x(1:cam) 0],'-','LineWidth',lw,'MarkerSize',msz,'DisplayName','Soil structure');hold all;
plot(a_m, rho_m, '^','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',lw,'MarkerSize',msz,'DisplayName','Measured')
hleg = legend('-DynamicLegend', 'Location', 'Best' );
% hleg.String(end)=[];

ylabel('Resistivity [\Omega.m]');
xlabel('Electrode spacing (depth) [m]');
grid on;


hold off

end

