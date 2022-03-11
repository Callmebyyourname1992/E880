function tk = Tn(z,i)
%This function computes Tn(x) in Chebychev Polynomial

tk = [1 z];

if(i==0)
    tk = 1;
    elseif (i==1)
        tk = z;    
    elseif (i==2)
        tk = 2*z^2 - 1;
    elseif (i>=3)
        for k=3:i
            tk(k) = 2*z*tk(k-1) - tk(k-2); 
        end
        tk = tk(end);   
end



    
