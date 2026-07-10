clc; clear; close all

N=1000; snr=10; c=[1 -1 1 1 -1 1 -1 -1];
b1=randi([0 1],1,N); b2=randi([0 1],1,N);

s1=kron(2*b1-1,c);
s2=kron(2*b2-1,c);

n=sqrt(10^(-snr/10)/2);
r1=filter(fliplr(c),1,s1+n*randn(1,length(s1)));
r2=filter(fliplr(c),1,s2+n*randn(1,length(s2)));

fprintf('User1 BER = %.4f\n',mean((r1(1:N)>0)~=b1))
fprintf('User2 BER = %.4f\n',mean((r2(1:N)>0)~=b2))