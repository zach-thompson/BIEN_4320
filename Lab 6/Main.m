clear all
close all
clc

% STEP 1:
wl=400:680; % Update the wavelength range as needed

%Load absorbance spectra of pure abosorbers A, B & C, and convert to mua
A=dlmread('Ref_A.txt');
B=dlmread('Ref_B.txt');
C=dlmread('Ref_C.txt');

A(:,2) = A(:,2)*2.303;
B(:,2) = B(:,2)*2.303;
C(:,2) = C(:,2)*2.303;

%load absorbance spectra of test solutions 1, 2 and 3 and convert to mua    
Solution_1=dlmread('TS_1.txt');
Solution_2=dlmread('TS_2.txt');
Solution_3=dlmread('TS_3.txt');

Solution_1(:,2) = Solution_1(:,2)*2.303;
Solution_2(:,2) = Solution_2(:,2)*2.303;
Solution_3(:,2) = Solution_3(:,2)*2.303;

% Interpolate spectra to the same wavelength and range
% mua spectra of pure absorbers
Ref_A= interp1(A(:,1),A(:,2),wl,'spline',NaN)';
Ref_B= interp1(B(:,1),B(:,2),wl,'spline',NaN)';
Ref_C= interp1(C(:,1),C(:,2),wl,'spline',NaN)';

% mua spectra test solutions
Solution_1= interp1(Solution_1(:,1),Solution_1(:,2),wl,'spline',NaN)';
Solution_2= interp1(Solution_2(:,1),Solution_2(:,2),wl,'spline',NaN)';
Solution_3= interp1(Solution_3(:,1),Solution_3(:,2),wl,'spline',NaN)';

%STEP 2:
[Conc, fit]= inversion(Solution_1,Ref_A,Ref_B); % Select spectra to invert along with chosen absorbers, update absorbers as needed

%Results and display

plot(wl,Solution_1)  % update the solution # as needed
hold on
plot(wl,fit,'r')
title('Test Sample 3 Spectra')
xlabel('Wavelengths (nm)')
ylabel('mua in cm ^-^1')
legend('Measured', 'Fit');
hold off



