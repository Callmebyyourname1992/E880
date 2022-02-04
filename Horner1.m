function [y,b] = Horner1(a,x)
    
    n = length(a) - 1; % length
    
    b = zeros(n,1);  % zeros column
    b(1) = a(1);
  
    for j=2:1:n
      
        b(j) = a(j) + b(j-1)*x;
    end % End of for loop j=2:n
    
    y=b(n);     % Sets y to the value in the array b at index n
                  
   
return