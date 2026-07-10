clc; clear; close all

M=4; N=1000; SNR=10;
p=[1 -1 1 -1]; h=[0.8 -0.4 0.2 -0.1];

tx=randi([0 M-1],1,N);
rx=filter(h,1,qammod(tx,M));

nv=1/(2*10^(SNR/10));
rx=rx+sqrt(nv)*(randn(size(rx))+1i*randn(size(rx)));

hc=conv(rx(randperm(N,4)),conj(fliplr(p)));
hc=hc(end-length(h)+1:end);

eq=filter(conj(hc)./(abs(hc).^2+nv),1,rx);
ber=mean(tx~=qamdemod(eq,M));

disp(['Bit Error Rate: ' num2str(ber)])