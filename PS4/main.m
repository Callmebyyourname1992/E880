%PS 4 - Econ 880
%Gunawan and Minh

%function
f = @(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
dfx = @(x) -2*100*2*x(1)*(x(2)-x(1)^2)-2*(1-x(1)); 
dfy = @(x) 2*100*(x(2)-x(1)^2);

x0 = [[0;0], [-1;-1], [-1;2]];

delta = 10^(-13);
eps = 10^(-13);

lambdastar = 0.1;
x = x0(:,2);
s=-[dfx(x);dfy(x)];
XO = x; %initial value
crit1 = 1;

i = 0;

while (crit1>eps)
    i = i+1;
    objf = @(lambda) f(XO+lambda*s);
    lambdastar = fminsearch(objf,lambdastar);
    x = XO + lambdastar*s;
    s = -[dfx(x);dfy(x)] + s*norm([dfx(x);dfy(x)])^2/(norm([dfx(XO);dfy(XO)])^2);
    crit1 = norm(x-XO)/(1+norm(x));
    crit2 = norm([dfx(x);dfy(x)])/(1+abs(f(XO)));
    if (i<=5)
        fprintf('x^k at k=%d is :[ ',i) 
        fprintf('%g ', x);
        fprintf(']'' \n'); 
    end 
    if (crit2<delta)
        break
    end
    XO = x;
end 

x