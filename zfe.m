clc; clear; close all

h=[0.1 0.3 0.4 0.2];
N=100; L=length(h);
s=randi([0 1],1,N);
r=awgn(conv(s,h),20,'measured');

w=zeros(1,L); y=zeros(1,N);

for i=1:N
    x=r(i:i+L-1);
    y(i)=w*x';
    w=w+(s(i)-y(i))*x/(x*x');
end

disp('Original Symbols')
disp(s)
disp('Equalized Symbols')
disp(y)