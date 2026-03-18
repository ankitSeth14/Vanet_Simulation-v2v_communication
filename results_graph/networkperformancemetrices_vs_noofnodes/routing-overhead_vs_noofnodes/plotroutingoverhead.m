clc;
clear;
close all;

% X-axis values
nodes = [10 20 30 40 50];

% Y-axis values
AODV  = [134.000 280.672 348.332 155.494 149.204];
OLSR  = [1.380 1.768 2.042 1.478 1.684];
DSDV  = [179.609 375.774 430.398 195.316 171.230];
AOMDV  = [134.000 280.672 348.332 155.494 150.525];
% Plotting
figure;

plot(nodes, AODV, '-o', 'LineWidth', 2); hold on;
plot(nodes, OLSR, '-d', 'LineWidth', 2);
plot(nodes, DSDV, '-x', 'LineWidth', 2);
plot(nodes, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('Number of Nodes');
ylabel('Routing Overhead');
title('Routing Overhead vs Number of Nodes');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([-3 440]);

hold off;