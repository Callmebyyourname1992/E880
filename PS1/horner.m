%Horner method
function result = horner(x,y)

A = [83521*y*y*y*y*y*y*y*y, 0, 578*y*y*y*y, 0, -2, 0, 2, 0, -1];

SUM = A(end);

for i=(length(A)-1):-1:1
SUM=A(i)+SUM*x;
end

result = SUM;
