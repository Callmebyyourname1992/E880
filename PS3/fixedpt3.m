function [x2 i] = fixedpt(x1,tolx,toly,n)
%disp('Fixed Point Iteration Method'); 

%# Start out iteration loop
x2 = 2*sin(2*pi*x1);

i = 0;% # iteration counter

%ezplot(f,[-1,1]);
%hold on 
%ezplot('x',[[-1,1]])

while (abs(x2-x1)/(1+abs(x1)) > tolx && abs(x2) > toly && i<n)
    %plot([x1 x1], [x1 x2], 'k-')
    %plot([x1 x2], [x2 x2], 'k--') 
    i = i + 1;
    x1 = x2;
    x2 = 2*sin(2*pi*x1);
end
