function[x]=backwardsub(A,b)
%This function solves an upper triangular system using backward substitution

n = size(A,1);
x=zeros(1,n);
x(1,n)=b(end)/A(n,n);

%backward substitution
for i=(n-1):-1:1   
        z=(1/A(i,i)).*(b(i)-sum(A(i,(i+1):end).*x((i+1):end)));
        x(i)=z;
end
x=x';
end