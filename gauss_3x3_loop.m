function result = gauss_3x3_loop(a,b)

    r = length(b);
    
    % solve
    for n = 1:(r-1)
        b(n) = b(n)/a(n,n);
        a(n,:) = a(n,:)/a(n,n);
        for m = (n+1):1:r
            b(m) = b(m) - [a(m,n)/a(n,n)]*b(n);
            a(m,:) = a(m,:) - [a(m,n)/a(n,n)]*a(n,:);
        end
    end
    
    % solution
    arr = zeros(r,1);
    arr(r) = b(r)/a(r,r);
    var1 = ['x' num2str(r)];
    fprintf("%s = %d\n",[var1], arr(r));
    
    for i = (r-1):-1:1
        arr(i) = [b(i) - a(i,i+1)*arr(i+1)];
        j = i+2;
        while j <= r
            temp = -a(i,j)*arr(j);
            arr(i) = arr(i) + temp;
            j = j+1;
        end
        var2 = ['x' num2str(i)];
        fprintf("%s = %d\n",[var2], arr(i));
    end

    result = arr;
    
    %{
    x5 = b(5)/a(5,5);
    x4 = b(4) - a(4,5)*x5;
    x3 = b(3) - a(3,4)*x4 - a(3,5)*x5;
    x2 = b(2) - a(2,3)*x3 - a(2,4)*x4 - a(2,5)*x5;
    x1 = b(1) - a(1,2)*x2 - a(1,3)*x3 - a(1,4)*x4 - a(1,5)*x5;
    %}
    
    %{
    var1 = ['x' num2str(r)];
    fprintf("%s = %d\n",[var1], [b(r)/a(r,r)]);
    
    for i = (r-1):-1:1
        var2 = ['x' num2str(i)];
        temp = [b(i) - a(i,1+1)*var1]
        fprintf("%s = %d\n",[var2], temp);
    end
    %}
    
    
    %{
    % solution (hard code)
    x3 = b(3)/a(3,3);
    x2 = b(2) - a(2,3)*x3;
    x1 = b(1) - a(1,2)*x2 - a(1,3)*x3;
    
    % print solution (hard code)
    fprintf("x1 = %d\n", x1);
    fprintf("x2 = %d\n", x2);
    fprintf("x3 = %d\n", x3);
    %}

end