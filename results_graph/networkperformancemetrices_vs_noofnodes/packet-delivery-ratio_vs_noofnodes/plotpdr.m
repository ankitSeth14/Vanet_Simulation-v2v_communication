clc;
clear;
close all;

% X-axis values
nodes = [10 20 30 40 50];

% Y-axis values
AODV  = [0.74 0.36 0.29 0.64 0.67];
OLSR  = [42.02 36.12 32.88 40.36 37.26];
DSDV  = [0.55 0.27 0.23 0.51 0.58];
AOMDV  = [0.74 0.36 0.29 0.64 0.66];

% Plotting
figure;

plot(nodes, AODV, '-o', 'LineWidth', 4); hold on;
plot(nodes, OLSR, '-d', 'LineWidth', 2);
plot(nodes, DSDV, '-x', 'LineWidth', 2);
plot(nodes, AOMDV, '-^', 'LineWidth', 2);
% Labels and Title
xlabel('Number of Nodes');
ylabel('Packet Delivery Ratio (%)');
title('PDR vs Number of Nodes');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([-3 50]);

hold off;