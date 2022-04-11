%PS 6 - Econ 880
%Gunawan and Minh
clc;
clear all;

%% Question 1
f = @(x) x.^(1/3);
n = [3 5 11];
a=0;
b=1;

%True Value
IntTrue = integral(f,a,b);

%% 1A. Trapezoid Rule
IntTpz = [];
for i=1:size(n,2)
    h = (b-a)/n(i);
    xi=[];
    for j=0:n(i)
        xi =[xi a + j*h];
    end
    fvalue = arrayfun(f,xi);
    IntTpz = [IntTpz 0.5*h*(fvalue(1)+2*sum(fvalue(2:end-1))+fvalue(end))];
end

%% 1B. Gauss-Chebyshev Rule
IntGC = [];
for i=1:size(n,2)
    xi = [];
    for j=1:n(i)
        xi = [xi cos((pi/(2*n(i)))*(2*j-1))];
    end
    fvalue = sqrt(1-xi.^2).*arrayfun(f,((xi+1)*(b-a)*0.5+a));
    IntGC = [IntGC (pi*(b-a)/(2*n(i)))*sum(fvalue)];
end

%% 1C. Gauss-Legendre
IntGL = [];
node3 = [ -0.7745966692414833770359	0.5555555555555555555556;
            0                           0.8888888888888888888889;
            0.7745966692414833770359	0.555555555555555555556];
node5 = [  -0.9061798459386639927976	0.2369268850561890875143;
            -0.5384693101056830910363	0.4786286704993664680413;
            0                           0.5688888888888888888889;
            0.5384693101056830910363	0.4786286704993664680413;
            0.9061798459386639927976	0.2369268850561890875143];
node11=	[-0.9782286581460569928039	0.0556685671161736664828,
		 -0.8870625997680952990752	0.1255803694649046246347,
		 -0.7301520055740493240934	0.1862902109277342514261,
		 -0.5190961292068118159257	0.2331937645919904799185,
		 -0.2695431559523449723315	0.2628045445102466621807,
		 0							0.2729250867779006307145,
		 0.269543155952344972332	0.262804544510246662181 ,
		 0.5190961292068118159257	0.2331937645919904799185,
		 0.7301520055740493240934	0.1862902109277342514261,
		 0.887062599768095299075	0.1255803694649046246347,
		 0.9782286581460569928039	0.055668567116173666483];  

IntGL(1) = 0.5*(b-a)*arrayfun(f,a+0.5*(node3(:,1)+1)*(b-a))'*node3(:,2);
IntGL(2) = 0.5*(b-a)*arrayfun(f,a+0.5*(node5(:,1)+1)*(b-a))'*node5(:,2);
IntGL(3) = 0.5*(b-a)*arrayfun(f,a+0.5*(node11(:,1)+1)*(b-a))'*node11(:,2);

%% Results - Relative Error
fprintf('Approximated integral using Trapezoid rule: %f \n\n', IntTpz);
fprintf('Approximated integral using Gauss-Chebyshev rule: %f \n\n', IntGC);
fprintf('Approximated integral using Gauss-Legendre rule: %f \n\n', IntGL);

res = [ abs(IntTpz-IntTrue)/IntTrue;
        abs(IntGC-IntTrue)/IntTrue;
        abs(IntGL-IntTrue)/IntTrue];
colNames={'n=3','n=5','n=11'};
rowNames={'Trapezoid','Gauss-Chebyshev','Gauss-Legendre'};

res = array2table(res,'RowNames',rowNames,'VariableNames',colNames);
res
   
%% Question 2

% True Value
f1 = @(x,y,z) exp(x+2*y+3*z) ;
integ1 = integral3(f1,0,1,0,1,0,1);

%% 2A. MC Integration using rand()
n=1:30;
MCa =[];
rng(888)
for j=1:size(n,2)
   MCint = 0;
   fi= [];
   iter = 100*n(j) ;
   for i=1:iter
       x1 = rand;           % First Upper intergral limit 10
       x2 = rand;           % Second Upper intergral limit 10
       x3 = rand;           % Third Upper intergral limit 10
       fi = [fi exp(x1+2*x2+3*x3)];  % Summation of function at random values
   end
   MCint = mean(fi);
   MCa = [MCa, MCint];
   end
   
% Plot for 2A   
fprintf('True value of the integral = %f \n\n', integ1);

axis1 = 1:30;
plot1 = abs(MCa-integ1)/integ1;
figure(1)
plot(axis1, plot1)
hold on
yline(0);
%plot(axis1, plot2)
hold off
xticks(linspace(0,30,6))
xticklabels(100*linspace(0,30,6))
xlabel('n')
ylabel('relative error')

legend('Relative Error (A)')

%% 2A. MC Integration using rand()
n=5:14;
MCb =[];
for j=1:size(n,2)
    x1 = linspace(0,1,n(j));           % First Upper intergral limit 10
    x2 = linspace(0,1,n(j));           % Second Upper intergral limit 10
    x3 = linspace(0,1,n(j));            % Third Upper intergral limit 10
    fi = [];
    for k=1:size(x1,2)
        for l=1:size(x2,2)
            for m=1:size(x3,2)
                fi = [fi exp(x1(k)+2*x2(l)+3*x3(m))];        
            end      
        end
    end  
   MCint = mean(fi);
   MCb = [MCb, MCint];
   end
   
% Plot for 2B   
axis2 = 1:10;
plot2 = abs(MCb-integ1)/integ1;
figure(2)
plot(axis2, plot2)
hold on
yline(0);
hold off
xticklabels(5:14)
xlabel('n^{1/3}')
ylabel('relative error')
legend('Relative Error (B)')


