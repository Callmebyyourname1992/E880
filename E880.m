%Problem Set 1 - Econ 880
%By: Minh Cao and Gunawan

clear all

%Question 1
x = 9478657;
y = 2298912;

result = myfunction(x,y)
result1 = myfunction1(x,y)

%Question 2

%Computer information:
%Intel(R) Core(TM) i5-1035G4 CPU @ 1.10GHz   1.50 GHz
%64-bit operating system

%initiate matrices
rng('default')
tic
A = rand(10^(4),10^(4));
B = rand(10^(4),10^(4));
fprintf('Elapsed time for variable initiation is %.5f\n',toc) ; 

%Addition
tic
A+B;
fprintf('Elapsed time for addition is %.5f\n',toc) ; 
%Multiplication
tic
A.*B;
fprintf('Elapsed time for multiplication is %.5f\n',toc) ; 
%Division
tic
A./B;
fprintf('Elapsed time for division is %.5f\n',toc) ; 
%Exponentiation
tic
A.^B;
fprintf('Elapsed time for exponentiation is %.5f\n',toc) ; 
%logarithmic
tic
log(A);
fprintf('Elapsed time for log function is %.5f\n',toc) ; 

%Question 3
epsilon1 = 1;
epsilon2 = 1;
epsilon3 = 1;
idx1=0;
idx2=0;
idx3=0;

while (1+(epsilon1/2)~=1)
    epsilon1 = epsilon1/2;
    idx1 = idx1+1;
end

while (0.001-(epsilon2/2)~=0.001)
    epsilon2 = epsilon2/2;
    idx2 = idx2+1;
end

while (1000-(epsilon3/2)~=1000)
    epsilon3 = epsilon3/2;
    idx3 = idx3+1;
end

epsilon1
idx1
epsilon2
idx2
epsilon3
idx3

%Verify if the answers are correct
epsilon1 == eps(1)
-idx1 == log2(eps(1))
epsilon2 == eps(0.001)
-idx2 == log2(eps(0.001))
epsilon3 == eps(1000)
-idx3 == log2(eps(1000))


%Question 4

%Question 4a
tol = [0.01,10^-4,10^-6];
resx = zeros(5,3);
resx(1,:)=tol;

for i=1:size(tol,2)

idx = 2;
x1  = 1/2;
x2 = x1 + 2^(-2);
 
while (norm(x2-x1)>=tol(i)) 
    if idx == 100000
        break
    end
    idx = idx+1;
    x1 = x2;
    x2 = x2 + 2^(-idx);
end

resx(2,i)= idx; 
resx(3,i)= x2;

idx = 2;
x1  = 1/2;
x2 = x1 + 2^(-2);
 
while (norm(x2-x1)/(norm(x2-x1)+1)>=tol(i)) 
    if idx == 100000
        break
    end
    idx = idx+1;
    x1 = x2;
    x2 = x2 + 2^(-idx);
end

resx(4,i)= idx; 
resx(5,i)= x2;
end

%Result for x
resx
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Testing if the results are correct for tol = 0.01
x = [0.5];
for i = 2:20
x(i) = x(i-1) +2^(-i);
end    

absnorm = norm(x(14)-x(13))
absnorm < tol(2)
absnorm/(absnorm+1) < tol(2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

resy = zeros(5,3);
resy(1,:)=tol;

for i=1:size(tol,2)

idx = 2;
y1  = 1;
y2 = y1 + (1/2);
 
while (norm(y2-y1)>=tol(i)) 
    if idx == 100000
        break
    end
    idx = idx+1;
    y1 = y2;
    y2 = y2 + (1/idx);
end

resy(2,i)= idx; 
resy(3,i)= y2;

idx = 2;
y1  = 1;
y2 = y1 +(1/2);
 
while (norm(y2-y1)/(norm(y2-y1)+1)>=tol(i)) 
    if idx == 100000
        break
    end
    idx = idx+1;
    y1 = y2;
    y2 = y2 + (1/idx);
end

resy(4,i)= idx; 
resy(5,i)= y2;
end

%Result for y
resy
