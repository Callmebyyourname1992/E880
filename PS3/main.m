%PS 3- Econ 880
%By: Gunawan and Minh

%Question 1
A = [54 14 -11 2; 14 50 -4 29; -11 -4 55 22; 2 29 22 95]
b = [1 1 1 1]'

%true solution; for verification
%z = inv(A)*b

%Question 1a - Gauss-Jacobi method
tol = 10^(-13);
x = [0 0 0 0]'; %initial value
XO = x;
stopcrit = 1;

tic
k=0;

while (stopcrit > tol)
    for i=1:length(x)
        x(i) = (1/A(i,i))*(b(i) -A(i,:)*XO + A(i,i)*XO(i));
    end
    k = k+1;
    stopcrit = norm(x-XO);
    XO=x;
end

gaussjacobitime = toc

%last iteration
k

%Result
x
%Residual
A*x-b

%Question 1b - Gauss-Seidel method
tol = 10^(-13);
x = [0 0 0 0]'; %initial value
XO = x;        
stopcrit = 1;

tic
k=0;
while (stopcrit>tol)
    for i=1:length(x)
        x(i) = (1/A(i,i))*(b(i) -A(i,1:(i-1))*x(1:(i-1))-A(i,(i+1):end)*XO((i+1):end));
    end
    k = k+1;
    stopcrit = norm(x-XO);
    XO=x;
end

gaussseideltime =toc

%last iteration
k
%Result
x
%Residual
A*x-b
   
%Question 2
B = [1,0.5,0.3;0.6,1,0.1;0.2,0.4,1];
r = [5 7 4]';

%Gauss-Jacobi Fixed-Point Iteration Method
tol = 10^(-13);
q = [0 0 0 ]'; %initial value
QO = q;
stopcrit = 1;

k=0;

while (stopcrit > tol)
    for i=1:length(q)
        q(i) = (1/B(i,i))*(r(i) -B(i,:)*QO + B(i,i)*QO(i));
    end
    k = k+1;
    stopcrit = norm(q-QO);
    QO=q;
end

%last iteration
k
%Result
q
%Residual
B*q-r

%Extrapolation Method
G = eye(size(B,1))-B;
q = [ 0 0 0 ]';
QO = q;
w = 0.5;
tol = 10^(-13);
stopcrit = 1;

k=0;
while (stopcrit > tol)
    q = w.*G*q + w.*r +(1-w).*q;    
    k = k+1;
    stopcrit = abs(q-QO);
    QO=q;
end

%last iteration
k
%Result
q
%Residual
B*q-r

%Question 3

%functions
fct1 = @(x) sin(2*pi*x) - 2*x;
dfct1 = @(x) 2*pi*cos(2*pi*x) - 2;
fct2 = @(x) sin(2*pi*x) - x;
dfct2 = @(x) 2*pi*cos(2*pi*x) - 1;
fct3 = @(x) sin(2*pi*x) - 0.5*x;
dfct3 = @(x)2*pi*cos(2*pi*x) - 0.5;

tolx = 1E-16;
toly = 1E-16;
N = 10^5; %max iteration
x0 = linspace(-2,2,20);

%Bisection
res_bisect = zeros(2*(length(x0)-1),5);

for i=2:length(x0)
    low = x0(1);
    high = x0(i);
    res_bisect(i-1,1) = low;
    res_bisect(i-1,2) = high;
    res_bisect(i-1,3) = bisection(fct1, low, high, tolx, toly);
    res_bisect(i-1,4) = bisection(fct2, low, high, tolx, toly);
    res_bisect(i-1,5) = bisection(fct3, low, high, tolx, toly);
end

for i=1:(length(x0)-1)
    low = x0(end-i);
    high = x0(end);
    res_bisect((length(x0)-1)+i,1) = low;
    res_bisect((length(x0)-1)+i,2) = high;
    res_bisect((length(x0)-1)+i,3) = bisection(fct1, low, high, tolx, toly);
    res_bisect((length(x0)-1)+i,4) = bisection(fct2, low, high, tolx, toly);
    res_bisect((length(x0)-1)+i,5) = bisection(fct3, low, high, tolx, toly);
end

colNames={'x_{low}','x_{high}','f_{1}(x)','f_{2}(x)','f_{3}(x)'};
res_bisect = array2table(res_bisect,'VariableNames',colNames);

format short
res_bisect

%Newton
res_newton = zeros(length(x0),4);
res_newton(:,1) = x0;

for i=1:length(x0)
    res_newton(i,2) = newton(fct1,dfct1,x0(i),tolx,toly,N);
    res_newton(i,3) = newton(fct2,dfct2,x0(i),tolx,toly,N);
    res_newton(i,4) = newton(fct3,dfct3,x0(i),tolx,toly,N);
end

colNames={'x_{0}','f_{1}(x)','f_{2}(x)','f_{3}(x)'};
res_newton = array2table(res_newton,'VariableNames',colNames);

format short
res_newton

%secant
res_secant = zeros(length(x0)-1,5);

for i=1:(length(x0)-1)
    m0 = x0(i);
    m1 = x0(i+1);
    res_secant(i,1) = m0;
    res_secant(i,2) = m1;
    res_secant(i,3) = secant(fct1, m0, m1, tolx, toly, N);
    res_secant(i,4) = secant(fct2, m0, m1, tolx, toly, N);
    res_secant(i,5) = secant(fct3, m0, m1, tolx, toly, N);
end

colNames={'x_{k-h}','x_{k+h}','f_{1}(x)','f_{2}(x)','f_{3}(x)'};
res_secant = array2table(res_secant,'VariableNames',colNames);

format short
res_secant

%fixed point iteration
N = 10^6; %max iteration

res_fixed = zeros(length(x0),4);
res_fixed(:,1) = x0;

for i=1:length(x0)
    x1 = x0(i);
    res_fixed(i,2) =  fixedpt1(x1,tolx,toly,N);
    res_fixed(i,3) =  fixedpt2(x1,tolx,toly,N);
    res_fixed(i,4) =  fixedpt3(x1,tolx,toly,N);
end

colNames={'x_{0}','f_{1}(x)','f_{2}(x)','f_{3}(x)'};
res_fixed = array2table(res_fixed,'VariableNames',colNames);

format short
res_fixed
    