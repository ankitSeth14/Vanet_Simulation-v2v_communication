clc;
clear;
close all;

% X-axis values
band = [10 20 30 40 50];

% Y-axis values
AODV  = [312.994 703.861 978.346 1267.428 1415.052];
OLSR  = [3.016 7.145 12.784 19.039 23.016];
DSDV  = [778.352 2533.014 4507.381 4044.633 5711.433];
AOMDV = [307.256 665.394 931.256 1270.655 1690.868];
% Plotting
figure;

plot(band, AODV, '-o', 'LineWidth', 4); hold on;
plot(band, OLSR, '-d', 'LineWidth', 2);
plot(band, DSDV, '-x', 'LineWidth', 2);
plot(band, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('BandWidth (Mbps)');
ylabel('Routing Overhead');
title('Routing Overhead vs BandWidth');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([2 5750]);

hold off;