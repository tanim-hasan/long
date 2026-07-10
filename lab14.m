clc; clear; 
freq = [900e6; 1800e6; 2700e6];  
vel_kmh = 120; 
vel = vel_kmh * 1000 / 3600;  
c = 3e8; r = 1; 
fm = zeros(3,1); 
Nr = zeros(3,1); 
FD = zeros(3,1); 
for x = 1:3 
    fm(x) = (vel * freq(x)) / c; 
    Nr(x) = sqrt(2*pi) * fm(x) * r * exp(-r^2); 
    FD(x) = (exp(r^2) - 1) / (r * fm(x) * sqrt(2*pi)); 
end 
disp('Maximum Doppler Frequency (Hz):') 
disp(fm) 
disp('Level Crossing Rate (Nr):') 
disp(Nr) 
disp('Average Fade Duration (AFD):') 
disp(FD)