clc;
clear;
close all;

% X-axis values
band = [10 20 30 40 50];

% Y-axis values
AODV  = [0.404889 1.416276 2.510408 3.427619 3.589533];
OLSR  = [0.672426 3.329228 4.163392 4.398166 4.568060];
DSDV  = [0.755316 3.489119 3.233136 3.067720 4.437970];
AOMDV = [0.421117 1.343052 2.378720 3.421418 4.019070];
% Plotting
figure;

plot(band, AODV, '-o', 'LineWidth', 4); hold on;
plot(band, OLSR, '-d', 'LineWidth', 2);
plot(band, DSDV, '-x', 'LineWidth', 2);
plot(band, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('BandWidth (m/s)');
ylabel('End-to-End Delay (s)');
title('End-to-End Delay vs BandWidth');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([-3 5]);

hold off;