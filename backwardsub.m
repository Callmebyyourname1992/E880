function y = backwardsub(a,b)
%Solve the system of linear equation ax = b
% a is a upper triangular matrix
% b is a column vector of coefficient
% y is the column vector of solution

n = length(b);
y(n,1) = b(n)/a(n,n);
for i = n-1:-1:1
    y(i,1) = (b(i) - a(i,i+1:n)*y(i+1:n,1))./a(i,i);
end