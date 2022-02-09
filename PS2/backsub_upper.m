function[x]=backsub_upper(A,b)
%This function solve an up triangular system using backward substitution
%method. The standard call is: "x=backward(U,b) in wich U and b represent
%respectively the up triangular matrix and  the known term.

%******************
%Riccardo Dessì
%e-mail:ri.dessi1@studenti.unica.it
%******************
n = size(A,1);

x=zeros(1,n);

x(1,n)=b(end)/A(n,n);

%bacward substitution
for i=(n-1):-1:1   
        z=(1/A(i,i)).*(b(i)-sum(A(i,(i+1):end).*x((i+1):end)));
        x(i)=z;
end
x=x';
end