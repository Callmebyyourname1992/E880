function [approx] = chebyshev(a,b,n,m,f,w)
%This follows Ken Judd, p. 223
k = linspace(a,b,m);

%Step 1
z = -cos(pi*(2* (1:m) -1)/(2*m));

%Step 2
x = (z+1)*(b-a)/2 + a;

%Step 3
y = f(x);

ai = [];

for i=1:n
   Ti =[];
   for k =1:length(z)
    Ti = [Ti; Tn(z(k),i)];
   end
   ai(i) = (y*Ti)/sum(Ti.^2);
end

approx = 0;

for i=1:length(ai)
    approx = approx + ai(i)*Tn((2*(w-a)/(b-a))-1,i);
end

