clc;
clear;
close all;

% X-axis values
speed = [5 10 15 20 25];

% Y-axis values
AODV  = [0.19 0.67 0.60 0.37 0.32];
OLSR  = [21.09 37.26 37.97 27.91 24.90];
DSDV  = [0.15 0.58 0.36 0.24 0.13];
AOMDV = [0.19 0.66 0.59 0.37 0.32];
% Plotting
figure;

plot(speed, AODV, '-o', 'LineWidth', 4); hold on;
plot(speed, OLSR, '-d', 'LineWidth', 2);
plot(speed, DSDV, '-x', 'LineWidth', 2);
plot(speed, AOMDV, '-^', 'LineWidth', 2);


% Labels and Title
xlabel('Node Speed (m/s)');
ylabel('Packet Delivery Ratio (%)');
title('PDR vs Node Speed');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([-3 38]);

hold off;