clc; clear; close all

ht=100; hr=1; H=log10(ht);

f=900:100:1800; d=5;
a=(1.1*log10(f)-0.7)*hr-(1.56*log10(f)-0.8);
PL=69.55+26.16*log10(f)-13.82*H-a+(44.9-6.55*H)*log10(d);
subplot(2,1,1)
plot(f,PL,'b-o','LineWidth',1.5), grid on
title('Path Loss vs Frequency'), xlabel('Frequency (MHz)'), ylabel('Path Loss (dB)')

f=900; d=1:20;
a=(1.1*log10(f)-0.7)*hr-(1.56*log10(f)-0.8);
PL=69.55+26.16*log10(f)-13.82*H-a+(44.9-6.55*H)*log10(d);
subplot(2,1,2)
plot(d,PL,'r-s','LineWidth',1.5), grid on
title('Path Loss vs Distance'), xlabel('Distance (km)'), ylabel('Path Loss (dB)')