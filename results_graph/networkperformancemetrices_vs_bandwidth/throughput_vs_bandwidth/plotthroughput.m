clc;
clear;
close all;

% X-axis values
band = [10 20 30 40 50];

% Y-axis values
AODV  = [1.27 1.12 1.19 1.23 1.17];
OLSR  = [1.00 0.98 0.85 0.80 0.82];
DSDV  = [0.53 0.33 0.28 0.41 0.36];
AOMDV = [1.29 1.17 1.20 1.15 1.13];
% Plotting
figure;

plot(band, AODV, '-o', 'LineWidth', 4); hold on;
plot(band, OLSR, '-d', 'LineWidth', 2);
plot(band, DSDV, '-x', 'LineWidth', 2);
plot(band, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('BandWidth (Mbps)');
ylabel('Throughput (Mbps)');
title('Throughput vs BandWidth');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([0 1.5]);

hold off;