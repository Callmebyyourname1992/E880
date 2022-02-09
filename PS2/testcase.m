%Solve the system of linear equation ax = b
% a is a upper triangular matrix
% b is a column vector of coefficient
% y is the column vector of solution


a = [2 -4 1; 6 2 -1; -2 6 -2]
b = [4 10 -6]
y= backwardsub(a,b)