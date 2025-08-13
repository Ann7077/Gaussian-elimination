close all;
clear all;

% example 1 - simpliest case
a1 = [5 2 3; 4 7 6; 8 9 10];
b1 = [28; 53; 83];

ref1 = a1\b1

x1 = gauss_3x3_loop(a1,b1);

% example 2 - zero on top left corner
a2 = [0 2 3 4; 1 0 2 3; 4 1 0 2; 3 4 1 0];
b2 = [9; 6; 7; 8];

ref2 = a2\b2

x2 = gauss_3x3_loop(a2,b2);

% example 3 - zeros on diagonal while solving
a3 = [1 2 0 1; 2 1 1 1; 3 0 2 3; 1 -1 2 0];
b3 = [3; 0; 4; 1];

ref3 = a3\b3

x3 = gauss_3x3_loop(a3,b3);

% example 4 - zero on bottom right corner at last step
a4 = [1 1 1 1; 2 3 4 5; 3 5 7 9; 4 7 10 13];
b4 = [10; 20; 30; 1];

ref4 = a4\b4

x4 = gauss_3x3_loop(a4,b4);


%a2 = [2 3 4; 5 6 7; 7 9 11];
%b2 = [13; 32; 45];

%x2 = gauss_3x3_loop(a2,b2);
