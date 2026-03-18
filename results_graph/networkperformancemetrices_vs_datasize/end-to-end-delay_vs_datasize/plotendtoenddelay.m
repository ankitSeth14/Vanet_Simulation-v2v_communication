clc;
clear;
close all;

% X-axis values
size = [1024 2048 3072 4096 5120];

% Y-axis values
AODV  = [2.510408 0.674715 0.811093 0.475361 0.422016];
OLSR  = [4.163392 2.407654 3.031712 1.627965 0.656603];
DSDV  = [3.233136 2.944463 2.602634 1.240066 0.708739];
AOMDV = [2.378720 0.635048 0.815563 0.488410 0.354372];
% Plotting
figure;

plot(size, AODV, '-o', 'LineWidth', 4); hold on;
plot(size, OLSR, '-d', 'LineWidth', 2);
plot(size, DSDV, '-x', 'LineWidth', 2);
plot(size, AOMDV, '-^', 'LineWidth', 2);


% Labels and Title
xlabel('Packet Data Size (Bytes)');
ylabel('End-to-End Delay (s)');
title('End-to-End Delay vs Packet Data Size');

% Legend
legend('AODV','OLSR','DSDV','AOMDV','Location','best');

% Grid
grid on;

% Axis limits (optional for better match)
ylim([0 4.5]);

hold off;