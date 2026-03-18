clc;
clear;
close all;

% X-axis values
speed = [5 10 15 20 25];

% Y-axis values
AODV  = [0.80 2.73 2.45 1.50 1.27];
OLSR  = [0.47 2.63 2.23 1.26 1.00];
DSDV  = [0.61 2.41 1.49 1.00 0.53];
AOMDV = [0.79 2.71 2.40 1.47 1.29];
% Plotting
figure;

plot(speed, AODV, '-o', 'LineWidth', 2); hold on;
plot(speed, OLSR, '-d', 'LineWidth', 2);
plot(speed, DSDV, '-x', 'LineWidth', 2);
plot(speed, AOMDV, '-^', 'LineWidth', 2);
% Labels and Title
xlabel('Node Speed (m/s)');
ylabel('Throughput (Mbps)');
title('Throughput vs Node Speed');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([0 3]);

hold off;