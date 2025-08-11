clear all;

a = [5 2 3; 4 7 6; 8 9 10];
b = [28; 53; 83];

ref = a\b

r = 3;

for n = 1:1:(r-1)
    b(n) = b(n)/a(n,n);
    a(n,:) = a(n,:)/a(n,n);
    for m = (n+1):1:r
        b(n+1) = b(n+1) - [a(n+1,n)/a(n,n)]*b(n);
        a(n+1,:) = a(n+1,:) - [a(n+1,n)/a(n,n)]*a(n,:);
    end
end

%x3 = b(r)/a(r,r);
%for n = (r-1):-1:1
    

        