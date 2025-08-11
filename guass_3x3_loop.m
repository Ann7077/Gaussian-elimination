clear all;

a = [5 2 3; 4 7 6; 8 9 10];
b = [28; 53; 83];

ref = a\b

r = 3;

for n = 1:1:(r-1)
    b(n) = b(n)/a(n,n);
    a(n,:) = a(n,:)/a(n,n);
    for m = (n+1):1:r
        b(m) = b(m) - [a(m,n)/a(n,n)]*b(n);
        a(m,:) = a(m,:) - [a(m,n)/a(n,n)]*a(n,:);
    end
end

%x3 = b(r)/a(r,r);
%for n = (r-1):-1:1

% solution
x3 = b(3)/a(3,3);
x2 = b(2) - a(2,3)*x3;
x1 = b(1) - a(1,2)*x2 - a(1,3)*x3;

% print solution
fprintf("x1 = %d\n", x1);
fprintf("x2 = %d\n", x2);
fprintf("x3 = %d\n", x3);
        