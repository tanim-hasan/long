clc; clear; close all

N=1000; L1=5; L2=2; mu=0.01;
b=2*randi([0 1],1,N)-1;
r=awgn(filter([1 0.5 0.2],1,b),20,'measured');

wf=zeros(1,L1); wb=zeros(1,L2); y=zeros(1,N);

for i=L1:N
    xf=r(i:-1:i-L1+1);
    xb=zeros(1,L2);
    if i>L2, xb=y(i-1:-1:i-L2); end

    z=wf*xf'-wb*xb';
    y(i)=sign(z);

    e=b(i)-z;
    wf=wf+mu*e*xf;
    wb=wb-mu*e*xb;
end

disp(['DFE BER = ' num2str(mean(b~=y))])