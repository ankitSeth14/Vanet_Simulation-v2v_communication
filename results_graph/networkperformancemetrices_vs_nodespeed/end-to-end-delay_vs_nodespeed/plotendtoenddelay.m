clc;
clear;
close all;

% X-axis values
speed = [5 10 15 20 25];

% Y-axis values
AODV  = [0.423972 0.436424 0.427408 0.424106 0.404889];
OLSR  = [0.635354 0.652086 0.661438 0.671632 0.672426];
DSDV  = [0.696943 0.639226 0.7398991 0.676671 0.755316];
AOMDV = [0.412590 0.450568 0.431613 0.425940 0.421117];
% Plotting
figure;

plot(speed, AODV, '-o', 'LineWidth', 2); hold on;
plot(speed, OLSR, '-d', 'LineWidth', 2);
plot(speed, DSDV, '-x', 'LineWidth', 2);
plot(speed, AOMDV, '-^', 'LineWidth', 2);

% Labels and Title
xlabel('Node Speed (m/s)');
ylabel('End-to-End Delay (s)');
title('End-to-End Delay vs Node Speed');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([0 1]);

hold off;