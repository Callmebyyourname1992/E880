function[x]=backsub_lower(A,b)
%This function solves a lower triangular system using backward substitution
%method

n = size(A,1);
x=zeros(1,n);
x(1,1)=b(1)/A(1,1);

%bacward substitution
for i=2:n   
        z=(1/A(i,i)).*(b(i)-sum(A(i,1:(i-1)).*x(1:(i-1))));
        x(i)=z;
end
x=x';
end