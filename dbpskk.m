clc;
clear;
close all;

rayChan = comm.RayleighChannel( ...
    'SampleRate',1000,...
    'MaximumDopplerShift',100);

x = ones(200,1);

y = rayChan(x);

p = 20*log10(abs(y)+eps);

figure;
plot(p,'LineWidth',1.2);
grid on;
xlabel('Sample Number');
ylabel('Magnitude (dB)');
title('Frequency-Flat Rayleigh Fading Channel');