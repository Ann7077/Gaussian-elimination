close all;
clear all;

a1 = [5 2 3; 4 7 6; 8 9 10];
b1 = [28; 53; 83];

ref = a1\b1

x1 = gauss_3x3_loop(a1,b1);

%a2 = [2 3 4; 5 6 7; 7 9 11];
%b2 = [13; 32; 45];

%x2 = gauss_3x3_loop(a2,b2);
