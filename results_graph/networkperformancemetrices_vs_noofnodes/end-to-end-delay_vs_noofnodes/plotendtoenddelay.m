clc;
clear;
close all;

% X-axis values
nodes = [10 20 30 40 50];

% Y-axis values
AODV  = [0.407912 0.407595 0.428061 0.425572 0.436424];
OLSR  = [0.649905 0.692543 0.650203 0.633127 0.652086];
DSDV  = [0.660567 0.655959 0.642992 0.641436 0.639226];
AOMDV  = [0.407912 0.407595 0.428061 0.425572 0.450658];
% Plotting
figure;

plot(nodes, AODV, '-o', 'LineWidth', 2); hold on;
plot(nodes, OLSR, '-d', 'LineWidth', 2);
plot(nodes, DSDV, '-x', 'LineWidth', 2);
plot(nodes, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('Number of Nodes');
ylabel('End-to-End Delay (s)');
title('End-to-End Delay vs Number of Nodes');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([0 1]);

hold off;