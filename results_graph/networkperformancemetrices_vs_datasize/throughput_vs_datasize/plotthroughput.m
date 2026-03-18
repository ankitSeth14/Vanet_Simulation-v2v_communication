clc;
clear;
close all;

% X-axis values
size = [1024 2048 3072 4096 5120];

% Y-axis values
AODV  = [1.19 1.43 0.54 0.64 0.23];
OLSR  = [0.85 1.04 0.27 0.25 0.09];
DSDV  = [0.28 0.58 0.06 0.10 0.04];
AOMDV = [1.20 1.42 0.52 0.65 0.25];
% Plotting
figure;

plot(size, AODV, '-o', 'LineWidth', 4); hold on;
plot(size, OLSR, '-d', 'LineWidth', 2);
plot(size, DSDV, '-x', 'LineWidth', 2);
plot(size, AOMDV, '-^', 'LineWidth', 2);


% Labels and Title
xlabel('Packet Data Size (Bytes)');
ylabel('Throughput (Mbps)');
title('Throughput vs Packet Data Size');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([-0.5 1.5]);

hold off;