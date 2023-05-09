%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
function [entropy] = entropy_calculate(image)
[M, N] = size(image);

entropy=0;

for(i=1:max(max(image)))
    counter=0;
    for(j=1:M*N)
        image(j);
        if image(j)==i
            counter=counter+1;
        end
       
       
   
    end
    if counter>0
            p=counter/(M*N);
            entropy=entropy-p*log2(p);
    end
end
        
            
            

end

