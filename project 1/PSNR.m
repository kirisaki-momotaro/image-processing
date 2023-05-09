function [psnr] = PSNR(image1, image2)


psnr=10*log10((max(max(image1))^2)/MSE(image1, image2));





end