%Problem Set 1 - Econ 880
%By: Gunawan and Minh Cao

clear all

%Question 1
%Question 1a
x = 9478657;
y = 2298912;

%direct method
tic
res_direct = direct(x,y)
toc
%Horner method
tic
res_horner = horner(x,y)
toc
%Question 1b
%estimate number of digits
1+floor(log10(83521)+log10(2298912^8))

%insert last digit of y into the expression
83251*(2^8)
%insert all digits of y into the expression
fprintf('%.0f\n',83251*y^8);

%Question 2

%Computer information:
%Intel(R) Core(TM) i5-1035G4 CPU @ 1.10GHz   1.50 GHz
%64-bit operating system

%initiate matrices
inittime =[];
addtime  =[];
multtime =[];
divtime  =[];
exptime  =[];
lntime  =[];

for i=1:10
tic
A = rand(10^(4),10^(4));
B = rand(10^(4),10^(4));
inittime = [inittime, toc];
%Addition
tic
A+B;
addtime  =[addtime, toc];

%Multiplication
tic
A.*B;
multtime =[multtime, toc];

%Division
tic
A./B;
divtime  =[divtime, toc];

%Exponentiation
tic
A.^B;
exptime  =[exptime, toc];

%logarithmic
tic
log(A);
lntime  =[lntime, toc];
end

fprintf('Average computation time for variable initiation is %.5f seconds\n',mean(inittime)) ; 
fprintf('Average computation time for addition is %.5f seconds\n',mean(addtime)) ;
fprintf('Average computation time for multiplication is %.5f seconds\n',mean(multtime)) ; 
fprintf('Average computation time for division is %.5f seconds\n',mean(divtime)) ; 
fprintf('Average computation time for exponentiation is %.5f seconds\n',mean(exptime)) ; 
fprintf('Average computation time for log function is %.5f seconds\n',mean(lntime)) ; 

%Question 3
epsilon1 = 1;
epsilon2 = 1;
epsilon3 = 1;
idx1=0;
idx2=0;
idx3=0;

while (1-(epsilon1/2)<1) && (1+(epsilon1/2)>1)
    epsilon1 = epsilon1/2;
    idx1 = idx1+1;
end

while (0.001-(epsilon2/2)<0.001) && (0.001+(epsilon2/2)>0.001)
    epsilon2 = epsilon2/2;
    idx2 = idx2+1;
end

while (1000-(epsilon3/2)<1000) && (1000+(epsilon3/2)>1000)
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
resx = zeros(4,3);

for i=1:size(tol,2)

counter = 1; %this is the number of iteration   
idx = 2; %this is the index of the variable generated in the iteration
x1  = 1/2;
x2 = x1 + 2^(-2);
 
while (norm(x2-x1)>=tol(i)) 
    if counter == 100000
        break
    end
    counter = counter + 1;
    idx = idx+1;
    x1 = x2;
    x2 = x2 + 2^(-idx);
end

resx(1,i)= counter; 
resx(2,i)= x2;

counter = 1; %this is the number of iteration   
idx = 2; %this is the index of the variable generated in the iteration
x1  = 1/2;
x2 = x1 + 2^(-2);
 
while (norm(x2-x1)/(norm(x1)+1)>=tol(i)) 
    if counter == 100000
        break
    end
    counter = counter + 1;
    idx = idx+1;
    x1 = x2;
    x2 = x2 + 2^(-idx);
end

resx(3,i)= counter; 
resx(4,i)= x2;
end

%Result for x

rowNames={'no. of iteration - absolute criteria','final guess - absolute criteria','no. of iteration - relative criteria','final guess - relative criteria'};
colNames = string(tol);
resultx = array2table(resx,'RowNames',rowNames,'VariableNames',colNames);

format long
resultx

%Question 4b
resy = zeros(4,3);

for i=1:size(tol,2)

counter = 1; %this is the number of iteration   
idx = 2; %this is the index of the variable generated in the iteration
y1  = 1;
y2 = y1 + (1/2);
 
while (norm(y2-y1)>=tol(i)) 
    if counter == 100000
        break
    end
    counter = counter + 1;
    idx = idx+1;
    y1 = y2;
    y2 = y2 + (1/idx);
end

resy(1,i)= counter; 
resy(2,i)= y2;

counter = 1; %this is the number of iteration   
idx = 2; %this is the index of the variable generated in the iteration
y1  = 1;
y2 = y1 +(1/2);
 
while (norm(y2-y1)/(norm(y1)+1)>=tol(i)) 
    if counter == 100000
        break
    end
    counter = counter + 1;
    idx = idx+1;
    y1 = y2;
    y2 = y2 + (1/idx);
end

resy(3,i)= counter; 
resy(4,i)= y2;
end

%Result for y

resulty = array2table(resy,'RowNames',rowNames,'VariableNames',colNames);

format long
resulty

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADDENDUM
% Testing if the results are correct
%x = [0.5];
%for i = 2:20
%x(i) = x(i-1) +2^(-i);
%end    

%absnorm = norm(x(20)-x(19))
%absnorm < tol(3)
%absnorm/(absnorm+1) < tol(3)


%y = [1];
%for i = 2:10^6
%y(i) = y(i-1)+(1/i);
%end    

%absnorm = norm(y(77881)-y(77880)) %tol not respected since we limited the iteration number up to 100,000
%absnorm < tol(1)
%absnorm/(norm(y(77880))+1) < tol(3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
