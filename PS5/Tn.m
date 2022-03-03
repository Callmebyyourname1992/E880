function tk = Tn(z,i)
%This function computes Tn(x) in Chebychev Polynomial

tk = [0 z];

for k=3:i
    tk(k) = 2*z*tk(k-1) - tk(k-2); 
end

tk = tk(end);

end