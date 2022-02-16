function m = newton(f,df,x0,tol,N)

x(1) = x0; % Set initial guess
n = 2; 
nfinal = N + 1; 
while (n <= N + 1)
  fe = f(x(n - 1));
  dfe = df(x(n - 1));
  x(n) = x(n - 1) - fe/dfe;
  if (abs(fe) <= tol)
    nfinal = n; 
    break
  end
  n = n + 1;
end

m = x(n);

%plot(0:nfinal - 1,x(1:nfinal),'o-')
%title('Solution:')
%xlabel('Iterations')
%ylabel('X')