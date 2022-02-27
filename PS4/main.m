%PS 4 - Econ 880
%Gunawan and Minh
clear all

%function
f = @(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
dfx = @(x) -2*100*2*x(1)*(x(2)-x(1)^2)-2*(1-x(1)); 
dfy = @(x) 2*100*(x(2)-x(1)^2);

%Steepest-Descent Method
x0 = [[0;0], [-1;-1], [-1;2]];
delta = 10^(-5);
eps = 10^(-10);

res_steep = zeros(5,3*2);
iter_steep = [];

for j=1:length(x0)
    i = 0;
    lambdastar = 1;
    x = x0(:,j);
    %XO = x; %initial value
    crit1 = 1;
    while (crit1>eps)
        i = i+1; 
        XO = x;
        s = -[dfx(XO);dfy(XO)] ;
        objf = @(lambda) f(XO+lambda*s);
        lambdastar = fminsearch(objf,lambdastar);
        x = XO + lambdastar*s;
        crit1 = norm(XO-x)/(1+norm(XO));
        crit2 = norm([dfx(XO);dfy(XO)])/(1+f(XO));
        if (i<=5)
            res_steep(i,2*(j-1)+1:2*(j-1)+2) = x';
            fprintf('x^k at k=%d is [ ',i) 
            fprintf('%g ', x);
            fprintf(']'' \n'); 
        end 
     %   XO = x;
    end
    if (crit2<delta)
        fprintf('Success! x_final = [ ');
        fprintf('%g ', x);
        fprintf(']'' \n'); 
    else
        fprintf('Convergence to a nonoptimal point x_final = [ ');
        fprintf('%g ', x);
        fprintf(']'' \n'); 
    end
    iter_steep = [iter_steep, i];
end

colNames={'x^{0}=0','y^0=0','x^{0}=-1','y^0=-1','x^0=-1','y^0=2'};
rowNames={'k=1','k=2','k=3','k=4','k=5'};
res_steep = array2table(res_steep,'RowNames',rowNames,'VariableNames',colNames);

res_steep
iter_steep

%Conjugate-Gradient Method
x0 = [[0;0], [-1;-1], [-1;2]];
delta = 10^(-5);
eps = 10^(-10);
res_conjug = zeros(5,3*2);
iter_conjug = [];

for j=1:length(x0)
    i = 0;
    lambdastar = 1;
    x = x0(:,j);
    XO = x; %initial value
    s=-[dfx(XO);dfy(XO)];
    crit1 = 1;
    while (crit1>eps)
        i = i+1;
        objf = @(lambda) f(XO+lambda*s);
        lambdastar = fminsearch(objf,lambdastar);
        x = XO + lambdastar*s;
        s = -[dfx(x);dfy(x)] + s*norm([dfx(x);dfy(x)])^2/(norm([dfx(XO);dfy(XO)])^2);
        crit1 = norm(XO-x)/(1+norm(XO));
        crit2 = norm([dfx(XO);dfy(XO)])/(1+abs(f(XO)));
        if (i<=5)
            res_conjug(i,2*(j-1)+1:2*(j-1)+2) = x';
            fprintf('x^k at k=%d is [ ',i) 
            fprintf('%g ', x);
            fprintf(']'' \n'); 
        end 
        XO = x;
    end 
    if (crit2<delta)
        fprintf('Success! x_final = [ ');
        fprintf('%g ', x);
        fprintf(']'' \n'); 
    else
        fprintf('Convergence to a nonoptimal point x_final = [ ');
        fprintf('%g ', x);
        fprintf(']'' \n'); 
    end
    iter_conjug = [iter_conjug, i];
end 

colNames={'x^{0}=0','y^0=0','x^{0}=-1','y^0=-1','x^0=-1','y^0=2'};
rowNames={'k=1','k=2','k=3','k=4','k=5'};
res_conjug = array2table(res_conjug,'RowNames',rowNames,'VariableNames',colNames);

res_conjug
iter_conjug