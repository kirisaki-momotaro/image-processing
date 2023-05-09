function [convolution] = Convolution(image1, kernel)
[m, n] = size(kernel);
[m1, n1] = size(image1);
M=m1-2*m;
N=n1-2*n;
h = rot90(kernel, 2);

convolution = zeros(M+m-1,n+N-1);

for x = 1 : M+m-1
    for y = 1 : n+N-1
        for i = 1 : m
            for j = 1 : n
                convolution(x, y) = convolution(x, y) + (image1(x+i-1, y+j-1) * h(i, j));
            end
        end
    end
end
end