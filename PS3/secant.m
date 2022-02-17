function [p i] = secant(f,p0,p1,tolx,toly,n)
%disp('Secant Method'); 

i = 2;
f0 = f(p0);
f1 = f(p1);
while i <= n
   p = p1-f1*(p1-p0)/(f1-f0);
   fp = f(p);
   if (abs(p-p1)/(1+abs(p1))<tolx)  && (abs(fp) < toly) 
      break;
   else
      i = i+1;
      p0 = p1;
      f0 = f1;
      p1 = p;
      f1 = fp;
   end
end
