function[x]=forwardsub(A,b)
%This function solves a lower triangular system using forward substitution

n = size(A,1);
x=zeros(1,n);
x(1,1)=b(1)/A(1,1);

%forward substitution
for i=2:n   
        z=(1/A(i,i)).*(b(i)-sum(A(i,1:(i-1)).*x(1:(i-1))));
        x(i)=z;
end
x=x';
end