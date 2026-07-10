clc;
clear;
close all;

T = (0:100)';
A = 5;
B = 10;
Y = A + 1i*B*T;

ricianChan = comm.RicianChannel( ...
    'SampleRate',1000,...
    'KFactor',6,...
    'MaximumDopplerShift',100);

Yout = ricianChan(Y);

YdB = 20*log10(abs(Yout)+eps);

figure;
plot(YdB,'LineWidth',1.2);
grid on;
xlabel('Sample');
ylabel('Magnitude (dB)');
title('Output of Rician Channel (Magnitude in dB)');