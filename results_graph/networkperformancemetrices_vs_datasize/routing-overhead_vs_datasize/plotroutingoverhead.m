clc;
clear;
close all;

% X-axis values
size = [1024 2048 3072 4096 5120];

% Y-axis values
AODV  = [978.346 824.078 1645.618 1431.982 2651.397];
OLSR  = [12.784 10.854 42.797 46.067 132.410];
DSDV  = [4507.381 2107.893 19772.076 11916.935 33915.084];
AOMDV = [931.256 821.204 1549.074 1492.631 2093.988];
% Plotting
figure;

plot(size, AODV, '-o', 'LineWidth', 4); hold on;
plot(size, OLSR, '-d', 'LineWidth', 2);
plot(size, DSDV, '-x', 'LineWidth', 2);
plot(size, AOMDV, '-^', 'LineWidth', 2);


% Labels and Title
xlabel('Packet Data Size (Bytes)');
ylabel('Routing Overhead');
title('Routing Overhead vs Packet Data Size');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([5 34000]);

hold off;