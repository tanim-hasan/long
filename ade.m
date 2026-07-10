clc; clear; close all

L=10; N=1000; mu=0.01; snr=20;
b=randi([0 1],1,N); s=2*b-1;

h=(randn(1,L)+1i*randn(1,L))/sqrt(2);
r=filter(h,1,s);
r=r+sqrt(10^(-snr/10))*(randn(size(r))+1i*randn(size(r)));

w=zeros(1,L); y=zeros(1,N);

for i=L:N
    x=r(i:-1:i-L+1);
    y(i)=w*x.';
    w=w+mu*conj(s(i)-y(i))*x;
end

ber=mean((real(y)>0)~=b);
disp(['BER = ' num2str(ber)])