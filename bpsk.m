clc; clear; close all

snr = 0:2:15;
b = randi([0 1],1e5,1);
x = 2*b-1;

for i = 1:length(snr)
    ber(i) = biterr(b,awgn(x,snr(i),'measured')>0)/length(b);
end

semilogy(snr,ber,'bo-',snr,berawgn(snr,'psk',2,'nondiff'),'r--','LineWidth',2)
grid on
xlabel('SNR (dB)')
ylabel('BER')
title('BPSK BER over AWGN')
legend('Simulation','Theory')