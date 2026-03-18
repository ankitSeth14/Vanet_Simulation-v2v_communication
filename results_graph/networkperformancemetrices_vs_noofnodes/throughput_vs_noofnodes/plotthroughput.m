clc;
clear;
close all;

% X-axis values
nodes = [10 20 30 40 50];

% Y-axis values
AODV  = [0.57 0.57 0.69 2.10 2.73];
OLSR  = [0.52 0.54 0.60 2.07 2.63];
DSDV  = [0.43 0.43 0.57 1.69 2.41];
AOMDV  = [0.57 0.57 0.69 2.10 2.71];
% Plotting
figure;

plot(nodes, AODV, '-o', 'LineWidth', 2); hold on;
plot(nodes, OLSR, '-d', 'LineWidth', 2);
plot(nodes, DSDV, '-x', 'LineWidth', 2);
plot(nodes, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('Number of Nodes');
ylabel('Throughput (Mbps)');
title('Throughput vs Number of Nodes');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([0 3]);

hold off;