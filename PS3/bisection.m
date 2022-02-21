function  [m i] = bisection(f, low, high, tolx, toly)
%disp('Bisection Method'); 

y1 = f(low);
y2 = f(high);
i = 0; 

if y1 * y2 > 0
   disp('No change in sign. Stop here.');
   m = NaN;
   return
end 

while (abs(high - low)/(1+abs(low)+abs(high)) >= tolx) && abs(f(high))>=toly
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

 