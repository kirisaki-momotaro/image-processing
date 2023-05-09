%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208


close all;
clear all;

%.................................Exercise 1...............................

%Part 1
%Gaussian Filter Construction
g=fspecial('gaussian',[5,5],1);

%Part 2
%Convolve image with gaussian filter
G0 = imread('cameraman.tif');
conv_res1=conv2(double(G0),double(g),'same');

figure()
imshow(G0,[]);
title('Input image');

%Part 3
%Downsample columnd and rows of filtered image for the first layer
G1=conv_res1(1:2:end,1:2:end);
figure()
imshow(G1,[]);

%Part 4
%Convolve filtered image with gaussian filter for the second layer
conv_res2=conv2(double(G1),double(g),'same');

%Part 5
%N-1 decomposition layers of gaussian pyramid 

%Downsampling for the second layer
G2=conv_res2(1:2:end,1:2:end);
figure()
imshow(G2,[]);

%Decomposition for the third layer of gaussian pyramid.
conv_res3=conv2(double(G2),double(g),'same');
G3=conv_res3(1:2:end,1:2:end);
figure()
imshow(G3,[]);

%Decomposition for the fourth layer of gaussian pyramid.
conv_res4=conv2(double(G3),double(g),'same');
G4=conv_res4(1:2:end,1:2:end);
figure()
imshow(G4,[]);

%..............................Exercise 2..................................

%Part 1- Part 2
%Computing Laplacian Pyramid for all decomposition layers.

%Upsampling first image
up_samp1=imresize(G1,2,'cubic');

%Computing L1 by subtracting every two sequential layers of the Gaussian pyramid 
L1=double(G0)-double(up_samp1);
figure()
imshow(L1,[]);


%Upsampling second image
up_samp2=imresize(G2,2,'cubic');

%Computing L2 by subtracting every two sequential layers of the Gaussian pyramid 
L2=double(G1)-double(up_samp2);
figure()
imshow(L2,[]);


%Upsampling third image
up_samp3=imresize(G3,2,'cubic');

%Computing L3 by subtracting every two sequential layers of the Gaussian pyramid 
L3=double(G2)-double(up_samp3);
figure()
imshow(L3,[]);

%Upsampling fourth image
up_samp4=imresize(G4,2,'cubic');

%Computing L4 by subtracting every two sequential layers of the Gaussian pyramid 
L4=double(G3)-double(up_samp4);
figure()
imshow(L4,[]);

%Computing the last layer of Laplacian Pyramid
%This layer of laplacian pyramid is the same with the correspodent gaussian layer.
L5=G4;
figure()
imshow(L5,[]);


%Part 3
%Recreating original image using Laplacian pyramid


%Resizing top of Laplacian-Gaussian pyramid and adding it to lower level of
%Laplacian pyramid

Final_image=imresize(G4,2,'cubic');
Final_image=Final_image+L4;

%Resizing Final_image and adding it to lower level of Laplacian pyramid

Final_image=imresize(Final_image,2,'cubic');
Final_image=Final_image+L3;

%Repeating step until final image is created

Final_image=imresize(Final_image,2,'cubic');
Final_image=Final_image+L2;

Final_image=imresize(Final_image,2,'cubic');
Final_image=Final_image+L1;

figure()
imshow(Final_image,[]);
title('Output image');







