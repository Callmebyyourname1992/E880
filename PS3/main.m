%PS 3- Econ 880
%By: Gunawan and Minh

%Question 1
A = [54 14 -11 2; 14 50 -4 29; -11 -4 55 22; 2 29 22 95]
b = [1 1 1 1]'

%true solution; for verification
z = inv(A)*b

%Question 1a - Gauss-Jacobi method
N = 100000; %max no of iteration
tol = 10^(-13);
x = [0 0 0 0]'; %initial value
XO = x;

k=1;
while (k<=N)
    for i=1:length(x)
        x(i) = (1/A(i,i))*(b(i) -A(i,:)*XO + A(i,i)*XO(i));
    end
        if norm(x-XO)<tol
            break
        end
    k = k+1;
    for i=1:length(x)
        XO(i)=x(i);
    end
end

%last iteration
k
%Result
x
%Residual
A*x-b

%Question 1b - Gauss-Seidel method
N = 100000; %max no of iteration
tol = 10^(-13);
x = [0 0 0 0]'; %initial value
XO = x;        
       
k=1;
while (k<=N)
    for i=1:length(x)
        x(i) = (1/A(i,i))*(b(i) -A(i,1:(i-1))*x(1:(i-1))-A(i,(i+1):end)*XO((i+1):end));
    end
        if norm(x-XO)<tol
            break
        end
    k = k+1;
    for i=1:length(x)
        XO(i)=x(i);
    end
end

%last iteration
k
%Result
x
%Residual
A*x-b
   
%Question 3

fct1 = @(x) sin(2*pi*x) - 2*x;
dfct1 = @(x) 2*pi*cos(2*pi*x) - 2;
fct2 = @(x) sin(2*pi*x) - x;
dfct2 = @(x) 2*pi*cos(2*pi*x) - 1;
fct3 = @(x) sin(2*pi*x) - 0.5*x;
dfct3 = @(x)2*pi*cos(2*pi*x) - 0.5;

low = -2;
high = 2;
tol = 1E-15;

x = bisection(fct2, low, high, tol); 

%bisection
%newton
x0 = 1; %first guess
N = 100000; %max iteration
x = newton(fct1,dfct1,x0,tol,N)

%secant

%fixed point iteration
    