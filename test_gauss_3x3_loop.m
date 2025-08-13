close all;
clear all;

% example 1 - simpliest case
a1 = [5 2 3; 4 7 6; 8 9 10];
b1 = [28; 53; 83];

ref1 = a1\b1

x1 = gauss_3x3_loop(a1,b1);

% example 2 - with leading zero
a2 = [0 2 3 4; 1 0 2 3; 4 1 0 2; 3 4 1 0];
b2 = [9; 6; 7; 8];

ref2 = a2\b2

x2 = gauss_3x3_loop(a2,b2);


%a2 = [2 3 4; 5 6 7; 7 9 11];
%b2 = [13; 32; 45];

%x2 = gauss_3x3_loop(a2,b2);
