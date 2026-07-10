clc; clear; close all;

input = randi(10,10);
m = qammod(input,16);
ch = awgn(m,10,'measured');
output = qamdemod(ch,16);

[error, ber] = biterr(input,output);

disp('Number of Errors = ')
disp(error)

disp('Bit Error Rate (BER) = ')
disp(ber)
