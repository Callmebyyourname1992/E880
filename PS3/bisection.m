function  [m i] = bisection(f, low, high, tol)
%disp('Bisection Method'); 

y1 = f(low);
y2 = f(high);
i = 0; 

if y1 * y2 > 0
   disp('Have not found a change in sign. Will not continue...');
   m = 'Error'
   return
end 

while (abs(high - low)/(1+abs(low)+abs(high)) >= tol ) 
    i = i + 1;
    m = (high + low)/2;
    y3 = feval(f, m);
    if y3 == 0
        return
    end
    if y1 * y3 > 0
        low = m;
        y1 = y3;
    else
        high = m;
    end
end 

% Show the last approximation considering the tolerance
%w = feval(f, m);
%fprintf('\n x = %f produces f(x) = %f \n %i iterations\n', m, y3, i-1);
%fprintf(' Approximation with tolerance = %f \n', tol); 

 