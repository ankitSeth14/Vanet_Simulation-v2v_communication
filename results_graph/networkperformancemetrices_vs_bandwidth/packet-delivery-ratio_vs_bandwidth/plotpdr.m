clc;
clear;
close all;

% X-axis values
band = [10 20 30 40 50];

% Y-axis values
AODV  = [0.32 0.14 0.10 0.08 0.07];
OLSR  = [24.90 12.28 7.25 4.99 4.16];
DSDV  = [0.13 0.04 0.02 0.02 0.02];
AOMDV = [0.32 0.15 0.11 0.08 0.06];

% Plotting
figure;

plot(band, AODV, '-o', 'LineWidth', 4); hold on;
plot(band, OLSR, '-d', 'LineWidth', 2);
plot(band, DSDV, '-x', 'LineWidth', 2);
plot(band, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('BandWidth (Mbps)');
ylabel('Packet Delivery Ratio (%)');
title('PDR vs BandWidth');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([-3 25]);

hold off;