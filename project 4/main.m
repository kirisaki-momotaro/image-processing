clear all 
close all
%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208

%Part 1
%constructing kernels of sizes 3x3,5x5,9x9
kernel3=ones(3);
kernel5=ones(5);
kernel9=ones(9);

%Part 2
%read image
input=imread('noisyimg.png');
input1=imread('noisyimg2.png');


%Part 3 
%FIRST IMAGE

%3x3
%Compute median 
inputM3=Compute_Median(input,kernel3);
%Compute max
inputMax3=Compute_Max(input,kernel3);
%Compute min
inputMin3=Compute_Min(input,kernel3);

%5x5
%Compute median 
inputM5=Compute_Median(input,kernel5);
%Compute max
inputMax5=Compute_Max(input,kernel5);
%Compute min
inputMin5=Compute_Min(input,kernel5);

%9x9
%Compute median 
inputM9=Compute_Median(input,kernel9);
%Compute max
inputMax9=Compute_Max(input,kernel9);
%Compute min
inputMin9=Compute_Min(input,kernel9);




%print outputs
figure()
subplot(3,1,1);
imshow(uint8(inputM3));
title('3x3');
subplot(3,1,2);
imshow(uint8(inputM5));
title('5x5');
subplot(3,1,3);
imshow(uint8(inputM9));
title('9x9');

figure()
subplot(3,1,1);
imshow(uint8(inputMax3));
title('3x3 max');
subplot(3,1,2);
imshow(uint8(inputMax5));
title('5x5 max');
subplot(3,1,3);
imshow(uint8(inputMax9));
title('9x9 max');

figure()
subplot(3,1,1);
imshow(uint8(inputMin3));
title('3x3 min');
subplot(3,1,2);
imshow(uint8(inputMin5));
title('5x5 min');
subplot(3,1,3);
imshow(uint8(inputMin9));
title('9x9 min');

%SECOND IMAGE

%3x3
%Compute median 
inputM31=Compute_Median(input1,kernel3);
%Compute max
inputMax31=Compute_Max(input1,kernel3);
%Compute min
inputMin31=Compute_Min(input1,kernel3);

%5x5
%Compute median 
inputM51=Compute_Median(input1,kernel5);
%Compute max
inputMax51=Compute_Max(input1,kernel5);
%Compute min
inputMin51=Compute_Min(input1,kernel5);

%9x9
%Compute median 
inputM91=Compute_Median(input1,kernel9);
%Compute max
inputMax91=Compute_Max(input1,kernel9);
%Compute min
inputMin91=Compute_Min(input1,kernel9);




%print outputs
figure()
subplot(3,1,1);
imshow(uint8(inputM31));
title('3x3');
subplot(3,1,2);
imshow(uint8(inputM51));
title('5x5');
subplot(3,1,3);
imshow(uint8(inputM91));
title('9x9');

figure()
subplot(3,1,1);
imshow(uint8(inputMax31));
title('3x3 max');
subplot(3,1,2);
imshow(uint8(inputMax51));
title('5x5 max');
subplot(3,1,3);
imshow(uint8(inputMax91));
title('9x9 max');

figure()
subplot(3,1,1);
imshow(uint8(inputMin31));
title('3x3 min');
subplot(3,1,2);
imshow(uint8(inputMin51));
title('5x5 min');
subplot(3,1,3);
imshow(uint8(inputMin91));
title('9x9 min');

%extra exersise
K=[1 0 1];
[M, N] = size(K);

%Part 2
%read image
Lena=imread('lena_gray_512.tif');

%Part 3
%zero padding
%LenaPZero=padarray(Lena,[1 1]);

%figure()
%imshow(uint8(LenaPZero));

%Part 4
%Convolutioning image with filter
%LenaPZeroConv1=conv2(Lena,K);
%K = rot90(kernel, 1);
%LenaPZeroConv2=conv2(Lena,K);

%LenaPZeroConv=LenaPZeroConv1+LenaPZeroConv2;
%figure()
%imshow(uint8(LenaPZeroConv));
%figure()
%imshow(uint8(LenaPZeroConv1));
%imshow(uint8(LenaPZeroConv2));
