
%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208

clc;
clear all;
close all;


I=imread('cameraman.tif');
%Downsampling
d4=imresize(I,1/2);
d5=imresize(I,1/4);
d6=imresize(I,1/8);

%upsampling
d1=imresize(d4,2);
MSE(I,d1)
d2=imresize(d5,4);
MSE(I,d2)
d3=imresize(d6,8);
MSE(I,d3)


figure()
subplot(3,1,1);
imshow(d1);
title('Downsampling First Scale Of Image')

subplot(3,1,2);
imshow(d2);
title('Downsampling Second Scale Of Image')

subplot(3,1,3);
imshow(d3);
title('Downsampling Third Scale Of Image')

%Aliasing

A4=I(1:2:end,1:2:end);
A5=I(1:4:end,1:4:end);
A6=I(1:8:end,1:8:end);

%Upsampling
A1=imresize(A4,2);
A2=imresize(A5,4);
A3=imresize(A6,8);
MSE(I,A1)

MSE(I,A2)

MSE(I,A3)

figure()
subplot(3,1,1);
imshow(A1)
title('Aliasing First Scale Of Image')

subplot(3,1,2);
imshow(A2)
title('Aliasing Second Scale Of Image')

subplot(3,1,3);
imshow(A3)
title('Aliasing Third Scale Of Image')

%Antialiasing

A4_imres=imresize(I,1/2);
A5_imres=imresize(I,1/4);
A6_imres=imresize(I,1/8);

%upsampling
A1_imres=imresize(A4_imres,2);
MSE(I,A1_imres)
A2_imres=imresize(A5_imres,4);
MSE(I,A2_imres)
A3_imres=imresize(A6_imres,8);
MSE(I,A3_imres)

figure()
subplot(3,1,1);
imshow(A1_imres)
title('Antialiasing First Scale Of Image')

subplot(3,1,2);
imshow(A2_imres)
title('Antialiasing Second Scale Of Image')

subplot(3,1,3);
imshow(A3_imres)
title('Antialiasing Third Scale Of Image')

%Image Reconstuction With Nearest Interpolation

NI4=imresize(I,1/2,'nearest');
NI5=imresize(I,1/4,'nearest');
NI6=imresize(I,1/8,'nearest');

%upsampling
NI1=imresize(NI4,2,'nearest');
MSE(I,NI1)
NI2=imresize(NI5,4,'nearest');
MSE(I,NI2)
NI3=imresize(NI6,8,'nearest');
MSE(I,NI3)



figure()
subplot(3,1,1);
imshow(NI1)
title('Neared Interpolation-Scale 1/2')

subplot(3,1,2);
imshow(NI2)
title('Neared Interpolation-Scale 1/4')

subplot(3,1,3);
imshow(NI3)
title('Neared Interpolation-Scale 1/8')


%Image Reconstuction With Cubic Interpolation

CI4=imresize(I,1/2,'cubic');
CI5=imresize(I,1/4,'cubic');
CI6=imresize(I,1/8,'cubic'); 

%upsampling
CI1=imresize(CI4,2,'cubic');
MSE(I,CI1)
CI2=imresize(CI5,4,'cubic');
MSE(I,CI2)
CI3=imresize(CI6,8,'cubic');
MSE(I,CI3)

figure()
subplot(3,1,1);
imshow(CI1)
title('Cubic Interpolation-Scale 1/2')

subplot(3,1,2);
imshow(CI2)
title('Cubic Interpolation-Scale 1/4')

subplot(3,1,3);
imshow(CI3)
title('Cubic Interpolation-Scale 1/8')


%Image Reconstuction With Bilinear Interpolation

LI4=imresize(I,1/2,'bilinear');
LI5=imresize(I,1/4,'bilinear');
LI6=imresize(I,1/8,'bilinear'); 

%upsampling
LI1=imresize(LI4,2,'bilinear');
MSE(I,LI1)
LI2=imresize(LI5,4,'bilinear');
MSE(I,LI2)
LI3=imresize(LI6,8,'bilinear');
MSE(I,LI3)

figure()

subplot(3,1,1);
imshow(LI1)
title('Linear Interpolation-Scale 1/2')

subplot(3,1,2);
imshow(LI2)
title('Linear Interpolation-Scale 1/4')

subplot(3,1,3);
imshow(LI3)
title('Linear Interpolation-Scale 1/8')

%---------------------------Comparisons---------------------------------


%Nearest Interpolation

n_err1= MSE(NI1,d1)
n_err2= MSE(NI2,d2)
n_err3= MSE(NI3,d3)

%Bicubic Interpolation

c_err1= MSE(CI1,d1)
c_err2= MSE(CI2,d2)
c_err3= MSE(CI3,d3)

%Bilinear Interpolation

l_err1= MSE(LI1,d1)
l_err2= MSE(LI2,d2)
l_err3= MSE(LI3,d3)




