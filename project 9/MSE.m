%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
function [mse] = MSE(image1, image2 )
[M, N] = size(image1);
squaredErrorImage = (double(image1) - double(image2)) .^ 2;

mse = sum(squaredErrorImage(:)) / (N * M);
%message = sprintf('The mean square error is %.2f.', mse);
%msgbox(message);
end

