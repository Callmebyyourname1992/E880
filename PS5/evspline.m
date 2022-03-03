function yy = evspline(a,b,c,d,xx,x)
%evaluate spline at point xx

n = length(x);

%first, determine in which interval is xx
i=1;
while (xx>x(i+1) && i<=n-1)
    i=i+1;
end

%xx is between x(i) and x(i+1)

yy = a(i)*(xx-x(i))^3+b(i)*(xx-x(i))^2+c(i)*(xx-x(i))+d(i);