%Horner method
function result = horner(x,y)

A = [578*y*y*y*y, -2, 2, -1];

SUM = A(end);

for i=(size(A,2)-1):-1:1
SUM=A(i)+SUM*x*x;
end

result = SUM + 83521*y*y*y*y*y*y*y*y;
