clear all;

a = [5 2 3; 4 7 6; 8 9 10];
b = [28; 53; 83];

ref = a\b;

% first row (1st time)
b(1) = b(1)/a(1,1);
a(1,:) = a(1,:)/a(1,1);

% second row (1st time)
b(2) = b(2) - [a(2,1)/a(1,1)]*b(1);
a(2,:) = a(2,:) - [a(2,1)/a(1,1)]*a(1,:);

% third row (1st time)
b(3) = b(3) - [a(3,1)/a(1,1)]*b(1);
a(3,:) = a(3,:) - [a(3,1)/a(1,1)]*a(1,:);

% second row (2nd time)
b(2) = b(2)/a(2,2);
a(2,:) = a(2,:)/a(2,2);

% third row (2nd time)
b(3) = b(3) - [a(3,2)/a(2,2)]*b(2);
a(3,:) = a(3,:) - [a(3,2)/a(2,2)]*a(2,:);

% solution
x3 = b(3)/a(3,3);
x2 = b(2) - a(2,3)*x3;
x1 = b(1) - a(1,2)*x2 - a(1,3)*x3;

% print solution
fprintf("x1 = %d\n", x1);
fprintf("x2 = %d\n", x2);
fprintf("x3 = %d\n", x3);