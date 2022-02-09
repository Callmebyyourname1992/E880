A = [54 14 -11 2; 14 50 -4 29; -11 -4 55 22; 2 29 22 95]
b = [1 1 1 1]'

%true solution; for verification
x = inv(A)*b

%Question 1a - LU decomposition

%self-coded back substitution
tic
[L U P] = lu(A);
z1star = forwardsub(L,b)
x1star = backwardsub(U,z1star)
toc
%Check residual
A*x1star - b

%For verification
%z1 = L\b
%x1 = U\z1
%A*x1-b

%Question 1b - Cholesky Decomposition
%self-coded back substitution
tic
Z = chol(A);
z2star = forwardsub(Z',b)
x2star = backwardsub(Z,z2star)
toc

%residual
A*x2star - b

%for verification
%z2 = Z'\b
%x2 = Z\z2
%A*x2 - b

