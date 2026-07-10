clc; clear; close all

U=4; S=10; G=0.8;
data=randi([0 1],U,S);
rx=zeros(U,S);
slot=mod(0:S-1,U)+1;

for i=1:S
    rx(slot(i),i)=data(slot(i),i)*G;
end

t=1:S;
subplot(2,1,1)
stem(t,data')
title('User Traffic')
xlabel('Time'), ylabel('Data')
legend('User1','User2','User3','User4')

subplot(2,1,2)
stem(t,rx')
title('Received Data')
xlabel('Time'), ylabel('Data')
legend('User1','User2','User3','User4')