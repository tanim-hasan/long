clc; clear; close all

figure; histogram(randn(1000,1),30);
title('Gaussian Noise using randn()'); grid on

figure; histogram(wgn(1000,1,5),30,'FaceColor','g');
title('Gaussian Noise using wgn()'); grid on
hold on;
x=-5:0.01:5;
plot(x,exp(-x.^2/2)/sqrt(2*pi)*300,'LineWidth',2);
title('Gaussian PDF'); grid on