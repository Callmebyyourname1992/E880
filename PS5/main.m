%PS5 - Econ 880
%Gunawan and Minh
clear all

syms x
x0 = 1;
f = @(x) (x^0.5+1)^(2/3);
df = @(x) 1/(3*x^(1/2)*(x^(1/2) + 1)^(1/3)); %@(x) diff(f,x); 
df2 = @(x) -1/(18*x*(x^(1/2) + 1)^(4/3)) - 1/(6*x^(3/2)*(x^(1/2) + 1)^(1/3));

%Taylor approximation
c0 = f(x0);
c1 = df(x0);
c2 = df2(x0)/2;


%Question 1b - Pade approximation
b1 = -c2/c1
a1 = c0*b1+c1
a0 = c0

%Question 2a - Chebyshev Regression Algorithm
%Ken Judd p. 223 
a=0;
b=2;
n=4;
m = n+1;
f = @(x) exp(4*x-2);

splinedata = linspace(0,2,5);
[b1 b2 b3 b4] = splinecoefs(splinedata,f(splinedata));


 x = linspace(a,b,101);
 
 fx = f(x);
 g = [];
 h = [];
 for j=1:length(x)
    g = [g, chebyshev(a,b,n,m,f,x(j))];
    h =  [h,evspline(b1,b2,b3,b4,x(j),splinedata)];
 end
 
plot(x,fx,x,g,x,h,'LineWidth',2)
title('Approximations for f(x)=e^{4x-2}')
xlabel('x') 
legend({'f(x)=e^{4x-2}','Chebyshev Interpolation','Cubic Spline'},'Location','northwest')

