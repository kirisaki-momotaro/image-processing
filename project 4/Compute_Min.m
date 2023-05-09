%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208


function [output] = Compute_Min(image1, kernel)
[m, n] = size(kernel);
[m1, n1] = size(image1);
M=m1-2*m;
N=n1-2*n;

image1=padarray(image1,[fix(m/2) fix(n/2)]);
output = zeros(m1,n1);

for x = 1 : m1
    for y = 1 : n1
        for i = 1 : m
            for j = 1 : n
                kernel(i,j)=image1(x+i-1, y+j-1);                
            end
        end
        output(x, y) = min(min(kernel));
        
    end
end
end