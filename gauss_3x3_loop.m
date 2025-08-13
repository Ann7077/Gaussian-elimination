function result = gauss_3x3_loop(a,b)

    r = length(b);

    %%% solve
    %{
    The outer loop deterines how many times the matrix will be gone
    through. For example, a 4x4 matrix would be gone through 3 times (ex: 
    1st time - row 1, 2, 3, 4. 2nd time - row 2, 3, 4. 3rd time - row 3, 
    4). Since at the beginning of every loop, what need to be done is 
    divid each value of the top row by that row's value on the diagonal, 
    that's what the first two lines in the outer for loop is for. Then it's 
    the inner for loop. After the first value at the beginning of each
    outer for loop, we would always do two things. One, the b value of that
    row is the current b value minues that row's first value divide by that
    row's value on the diagonal multipled by the b value. Two, each element
    of a in that row is the current value element minues that's row's first
    value divided by that row's value on the diagonal multiplied by that
    value of the element that is being operated on. 
    %}
    for n = 1:(r-1) 
        % This section helps with the the value on the diaagonal is zero
        % and need line switching. If a(n,n) == 0,then we use n1 to check
        % if the same location in the following line is also zero until we
        % we find one that's not zero with the while loop. Then we swap the
        % two lines. a(n,n) == 0 is written as (10^(-6) > a(n,n)) && 
        % (a(n,n) > -10^(-6)) to accommodate errors
        if (10^(-6) > a(n,n)) && (a(n,n) > -10^(-6))
            n1 = n+1;
                while (10^(-6) > a(n1,n)) && (a(n1,n) > -10^(-6)) == true
                    n1 = n1+1;
                end
                temp = a(n,:);
                a(n,:) = a(n1,:);
                a(n1,:) = temp;
                temp_b = b(n);
                b(n) = b(n1);
                b(n1) = temp_b;
        end
        
        % This is the actual solving part
        b(n) = b(n)/a(n,n);
        a(n,:) = a(n,:)/a(n,n);
        for m = (n+1):1:r
            b(m) = b(m) - (a(m,n)/a(n,n))*b(n);
            a(m,:) = a(m,:) - (a(m,n)/a(n,n))*a(n,:);
        end
    end


    %%% solution
    %{
    The three lines above the for loop calculates the x value for the
    highest order (ex: if the variables are x1 x2 x3 x4 x5, then the three 
    lines is calculating the value of x5). The first line under the for
    loop found the second term for any x values that's not the largest one
    (ex: calculate the second term for variable x4 and below). As you can
    see in the example, each x value has one more term than the previous x
    value. the job of the while loop is add the value of the new term to
    the array arr where all the x values are stored. It adds until there
    are no terms left, the exit the while loop and print out the final
    value.

    Example: 
    x5 = b(5)/a(5,5);
    x4 = b(4) - a(4,5)*x5;
    x3 = b(3) - a(3,4)*x4 - a(3,5)*x5;
    x2 = b(2) - a(2,3)*x3 - a(2,4)*x4 - a(2,5)*x5;
    x1 = b(1) - a(1,2)*x2 - a(1,3)*x3 - a(1,4)*x4 - a(1,5)*x5;
    %}

    arr = zeros(r,1);  % Create empty array with length of r

    arr(r) = b(r)/a(r,r); % This is used to find the x value of the highest order
    var1 = ['x' num2str(r)]; % This create an variable name
    fprintf("%s = %d\n", var1, arr(r)); 
    
    for i = (r-1):-1:1
        arr(i) = b(i) - a(i,i+1)*arr(i+1); 
        j = i+2;
        while j <= r
            temp = -a(i,j)*arr(j);
            arr(i) = arr(i) + temp;
            j = j+1;
        end
        var2 = ['x' num2str(i)];
        fprintf("%s = %d\n", var2, arr(i)); 
    end

    result = arr;    

end
