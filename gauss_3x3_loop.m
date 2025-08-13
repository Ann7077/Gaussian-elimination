function result = gauss_3x3_loop(a,b)

    r = length(b);
    
    %{
    %%% check leading zeros (only in the original matrix)

    for i = 1:r  % Loop over each row i from 1 to number of rows
        row_i = a(i,:);  % Get the entire row i of matrix a
        
        leading_zeros_i = 0;  % Initialize counter for leading zeros in row i
        
        for k = 1:length(row_i)  % Loop over each element k in the row
            if row_i(k) == 0  % Check if the element is zero
                leading_zeros_i = leading_zeros_i + 1;  % If zero, increase the count
            else
                break  % Stop counting zeros once a nonzero is found
            end
        end
        
        max_allowed = i - 1;  % Define max allowed leading zeros for row i (row 1 allows 0, row 2 allows 1, etc.)
        
        if leading_zeros_i > max_allowed  % If current row has too many leading zeros
            for j = (i+1):r  % Look for a row below i to swap with (rows j > i)
                row_j = a(j,:);  % Get row j
                
                leading_zeros_j = 0;  % Initialize leading zero counter for row j
                
                for k = 1:length(row_j)  % Count leading zeros in row j
                    if row_j(k) == 0
                        leading_zeros_j = leading_zeros_j + 1;
                    else
                        break  % Stop counting at first nonzero in row j
                    end
                end
                
                if leading_zeros_j <= max_allowed  % If row j meets the allowed zero count
                    % Swap row i and row j in matrix a
                    temp_row = a(i,:);
                    a(i,:) = a(j,:);
                    a(j,:) = temp_row;
                    
                    % Swap the corresponding elements in vector b
                    temp_b = b(i);
                    b(i) = b(j);
                    b(j) = temp_b;
                    
                    break  % Stop looking for more rows to swap after this swap
                end
            end
        end
    end
    %}


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
    
    %{
    %%% solution (hard code)
    x3 = b(3)/a(3,3);
    x2 = b(2) - a(2,3)*x3;
    x1 = b(1) - a(1,2)*x2 - a(1,3)*x3;
    
    %%% print solution (hard code)
    fprintf("x1 = %d\n", x1);
    fprintf("x2 = %d\n", x2);
    fprintf("x3 = %d\n", x3);
    %}

end