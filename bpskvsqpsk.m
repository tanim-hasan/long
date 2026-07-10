clc; clear; close all

snr = 0:2:15; N = 1e5;

for i = 1:length(snr)
    b = randi([0 1],N,1);
    ber1(i) = biterr(b,pskdemod(awgn(pskmod(b,2),snr(i),'measured'),2))/N;

    q = randi([0 3],N,1);
    ber2(i) = biterr(q,pskdemod(awgn(pskmod(q,4,pi/4),snr(i),'measured'),4,pi/4))/N;
end

semilogy(snr,ber1,'bo-',snr,ber2,'rs-','LineWidth',2)
grid on
xlabel('SNR (dB)')
ylabel('BER')
title('BER Comparison of BPSK and QPSK')
legend('BPSK','QPSK','Location','southwest')