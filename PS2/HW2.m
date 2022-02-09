A = [54 14 -11 2; 14 50 -4 29; -11 -4 55 22; 2 29 22 95]
b = [1 1 1 1]'

%true solution; for verification
x = inv(A)*b
y= backwardsub(A,b')

%Question 1a - LU decomposition
[L U P] = lu(A)

%For verification
z1 = L\b
x1 = U\z1

%self-coded back substitution
z1star = backsub_lower(L,b)
x1star = backsub2_upper(U,z1)

%Check residual
A*x1-b
A*x1star - b


%Question 1b - Cholesky Decomposition
Z = chol(A)

%for verification
z2 = Z'\b
x2 = Z\z2

%self-coded back substitution
z2star = backsub_lower(Z',b)
x2star = backsub2_upper(Z,z2)

%residual
A*x2 - b
A*x2star - b

