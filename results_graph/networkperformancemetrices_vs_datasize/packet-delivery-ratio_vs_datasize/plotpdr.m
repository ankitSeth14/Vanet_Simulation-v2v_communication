clc;
clear;
close all;

% X-axis values
size = [1024 2048 3072 4096 5120];

% Y-axis values
AODV  = [0.10 0.12 0.06 0.07 0.04];
OLSR  = [7.25 8.44 2.28 2.12 0.75];
DSDV  = [0.02 0.05 0.01 0.01 0];
AOMDV = [0.11 0.12 0.06 0.07 0.05];

% Plotting
figure;

plot(size, AODV, '-o', 'LineWidth', 4); hold on;
plot(size, OLSR, '-d', 'LineWidth', 2);
plot(size, DSDV, '-x', 'LineWidth', 2);
plot(size, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('Packet Data Size (Bytes)');
ylabel('Packet Delivery Ratio (%)');
title('Packet Delivery Ratio vs Packet Data Size');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([0 8.5]);

hold off;