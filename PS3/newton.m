function [m n] = newton(f,df,x0,tolx,toly,N)
%disp('Newton Method'); 

x(1) = x0; % Set initial guess
n = 2; 
nfinal = N + 1; 

while (n <= N + 1)
  fe = f(x(n - 1));
  dfe = df(x(n - 1));
  x(n) = x(n - 1) - fe/dfe;
  if ((abs(x(n)-x(n-1)))/(1+abs(x(n-1)))<tolx) && (abs(fe) < toly) 
    nfinal = n; 
    break
  end
  n = n + 1;
end

if(n>=N)
    m=NaN;
else 
    m = x(n);
end


%plot(0:nfinal - 1,x(1:nfinal),'o-')
%title('Solution:')
%xlabel('Iterations')
%ylabel('X')