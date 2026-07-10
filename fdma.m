clc; clear; close all

BW=10e6; U=5; Fc=1e6; Fs=100e6;
t=0:1/Fs:1e-3; bw=BW/U;

for i=1:U
    sig(i,:)=sin(2*pi*(Fc+(i-1)*bw)*t);
end

fdma=sum(sig);
rx=awgn(fdma,10,'measured');

figure
subplot(U+1,1,1)
plot(t,fdma)
title('FDMA Signal')

for i=1:U
    subplot(U+1,1,i+1)
    plot(t,rx.*sin(2*pi*(Fc+(i-1)*bw)*t))
    title(['User ' num2str(i)])
end