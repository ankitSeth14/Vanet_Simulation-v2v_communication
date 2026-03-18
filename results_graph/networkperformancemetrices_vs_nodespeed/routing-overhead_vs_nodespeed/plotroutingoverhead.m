clc;
clear;
close all;

% X-axis values
speed = [5 10 15 20 25];

% Y-axis values
AODV  = [517.530 149.204 165.461 269.874 312.994];
OLSR  = [3.742 1.684 1.633 2.583 3.016];
DSDV  = [684.523 171.230 277.998 414.044 778.352];
AOMDV = [520.415 150.525 169.193 272.203 307.256];
% Plotting
figure;

plot(speed, AODV, '-o', 'LineWidth', 2); hold on;
plot(speed, OLSR, '-d', 'LineWidth', 2);
plot(speed, DSDV, '-x', 'LineWidth', 2);
plot(speed, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('Node Speed (m/s)');
ylabel('Routing Overhead');
title('Routing Overhead vs Node Speed');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([-4 780]);

hold off;