clear all;

a = [2 3; 4 5];
b = [6; 8];

ref = a\b; 
  % This is the value of x1 and x2 calculated by MATLAB's build in function

% first row
b(1) = b(1)/a(1,1);        
% a(1,2) = a(1,2)/a(1,1);
% a(1,1) = a(1,1)/a(1,1);   
a(1, :) = a(1, :)/a(1,1); 
  % This line can replace the previous code I wrote, it divided each
  % element in row 1 of a by the value of a(1,1)

% second row
b(2) = b(2)-a(2,1)*b(1);
a(2,2) = a(2,2)-a(2,1)*a(1,2);

% solution
x2 = b(2)/a(2,2);
x1 = b(1)-a(1,2)*x2;

% print solution
fprintf("x1 = %d\n", x1);
fprintf("x2 = %d\n", x2);
