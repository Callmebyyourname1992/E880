%PS 3- Econ 880
%By: Gunawan and Minh

%Question 1
A = [54 14 -11 2; 14 50 -4 29; -11 -4 55 22; 2 29 22 95]
b = [1 1 1 1]'

%true solution; for verification
z = inv(A)*b

%Question 1a - Gauss-Jacobi method
N = 10^5; %max no of iteration
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
N = 10^5; %max no of iteration
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
   
%Question 2
B = [1,0.5,0.3;0.6,1,0.1;0.2,0.4,1];
r = [5 7 4]';

G = eye(size(B,1))-B;
q = [ 0 0 0 ]';
QO = q;
w = 1.05;
    
k=1;
while (k<=N)
    q = w.*G*q + w.*r +(1-w).*q;    
    if norm(q-QO)<tol
        break
    end
    k = k+1;
    QO=q;
end

%last iteration
k
%Result
q
%Residual
B*q-r

%Question 3

fct1 = @(x) sin(2*pi*x) - 2*x;
dfct1 = @(x) 2*pi*cos(2*pi*x) - 2;
fct2 = @(x) sin(2*pi*x) - x;
dfct2 = @(x) 2*pi*cos(2*pi*x) - 1;
fct3 = @(x) sin(2*pi*x) - 0.5*x;
dfct3 = @(x)2*pi*cos(2*pi*x) - 0.5;

low = -2;
high = 2;
tol = 1E-16;
N = 10^5; %max iteration

%bisection
[x_bisect1 bisectit1]= bisection(fct1, low, high, tol);
[x_bisect2 bisectit2]= bisection(fct2, low, high, tol);
[x_bisect3 bisectit3]= bisection(fct3, low, high, tol);

rowNames={'f_{1}(x)','f_{2}(x)','f_{3}(x)'};
colNames = {'x', 'no. of iterations'};

res1 = [x_bisect1 bisectit1; x_bisect2 bisectit2; x_bisect3 bisectit3]; 
res1 = array2table(res1,'RowNames',rowNames,'VariableNames',colNames);
format long
res1

%newton
x0 = 1; %first guess
[x_newton1 newtonit1] = newton(fct1,dfct1,x0,tol,N);
[x_newton2 newtonit2] = newton(fct2,dfct1,x0,tol,N);
[x_newton3 newtonit3] = newton(fct3,dfct1,x0,tol,N);

res2 = [x_newton1 newtonit1; x_newton1 newtonit2; x_newton1 newtonit3] ;
res2 = array2table(res2,'RowNames',rowNames,'VariableNames',colNames);
format long
res2

%secant
m0 = -2; %first approximation
m1 = 2; %2nd approximation

[x_sec1 secit1] = secant(fct1,m0,m1,tol,N);
[x_sec2 secit2] = secant(fct2,m0,m1,tol,N);
[x_sec3 secit3] = secant(fct3,m0,m1,tol,N);

res3 = [x_sec1 secit1; x_sec1 secit2; x_sec3 secit3] ;
res3 = array2table(res3,'RowNames',rowNames,'VariableNames',colNames);
format long
res3

%fixed point iteration
x1 = -2;
N = 10^3; %max iteration
[x_fixedpt1 fixedit1] = fixedpt(fct1,x1,tol,N);
[x_fixedpt2 fixedit2] = fixedpt(fct2,x1,tol,N);
[x_fixedpt3 fixedit3] = fixedpt(fct3,x1,tol,N);

res4 = [x_fixedpt1 fixedit1; x_fixedpt2 fixedit2; x_fixedpt3 fixedit3]; 
res4 = array2table(res4,'RowNames',rowNames,'VariableNames',colNames);

format long
res4


    