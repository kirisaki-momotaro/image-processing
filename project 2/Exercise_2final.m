close all;
clear all;


%........................Exercise 1.........................

%Part 1
%constructing filter
A=[1 2 1; 2 4 2; 1 2 1];
K=(1/16)*A;
[M, N] = size(K);

%Part 2
%read image
Lena=imread('lena_gray_512.tif');

%Part 3
%zero padding
LenaPZero=padarray(Lena,[M-1 N-1]);

%Part 4
%Convolutioning image with filter
LenaPZeroConv=Convolution(LenaPZero,K);

%Part 5
%Computing MSE value
MSE(Lena,LenaPZeroConv)

%Computing PSNR value
PSNR(Lena,LenaPZeroConv)

%Part 6
%Replicating border pixels of image.

%boarder padding
LenaPBoarder= padarray(Lena,[M-1 N-1],'replicate');
%convolution
LenaPBoarderConv=Convolution(LenaPBoarder,K);
%Computing MSE value 
MSE(Lena,LenaPBoarderConv)
%Computing PSNR value
PSNR(Lena,LenaPBoarderConv)


%........................Exercise2............................

%Part 1
%Covolution with default funtion conv2()
%for zero padding and replicating.....
LenaPZeroConv2=conv2(double(LenaPZero),double(K));
LenaPBoarderConv2=conv2(double(LenaPBoarder),double(K));

%Part 2
%resize back to 512,512
LenaPZeroConv2 = imcrop(LenaPZeroConv2,[3 3 511 511]);
LenaPBoarderConv2 = imcrop(LenaPBoarderConv2,[3 3 511 511]);

%Part 3
%Comparing Results
MSE(Lena,LenaPZeroConv2)
MSE(Lena,LenaPBoarderConv2)


%.......................Exercise 3........................

%Part 1
%Covolution with default funtion imfilter()
%for zero padding and replicating.....
LenaPZeroImfilt=imfilter(double(LenaPZero),double(K));
LenaPBoarderImfilt=imfilter(double(LenaPBoarder),double(K));

%Part 2
%resize back to 512,512
LenaPZeroImfilt = imcrop(LenaPZeroImfilt,[3 3 511 511]);
LenaPBoarderImfilt = imcrop(LenaPBoarderImfilt,[3 3 511 511]);

%Part 3
%Comparing Results
MSE(Lena,LenaPZeroImfilt)
MSE(Lena,LenaPBoarderImfilt)


%Show output images
figure()
subplot(1,2,1);
imshow(uint8(LenaPZeroConv));
title('Convolution zero padding');

subplot(1,2,2);
imshow(uint8(LenaPBoarderConv));
title('Convolution border padding');
figure()
subplot(1,2,1);
imshow(uint8(LenaPZeroConv2));
title('Conv2 zero padding');

subplot(1,2,2);
imshow(uint8(LenaPBoarderConv2));
title('Conv2 border padding');

figure()
subplot(1,2,1);
imshow(uint8(LenaPZeroImfilt));
title('imfilter zero padding');

subplot(1,2,2);
imshow(uint8(LenaPBoarderImfilt));
title('imfilter border padding');



figure()
imshow(uint8(Lena));
title('original image');







