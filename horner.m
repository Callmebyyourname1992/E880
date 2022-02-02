%Horner method
function result = horner(x,y)

A = [578*y^4, -2, 2, -1];

SUM = A(end);

for i=(A(end)-1):-1:1
SUM=A(i)+SUM*x^2;
end

result = SUM + 83521*y^8;
