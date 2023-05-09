%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208

clear all;
close all;

%Part 1
%Reading Image
I=imread('cameraman.tif');

%Part 2
%Rescaling Image
Inew=imresize(I,[30 30]);
downsized=Inew;

%Part3 
%FFT of New Image
fftInew=fft2(Inew,30,30);


%Part 4
%Illustrating New Image and its FFT
figure()
imagesc(Inew)
colormap('gray')
title('New Image')

figure()
imagesc(abs(fftshift(fftInew)))
colormap('gray')
title('Image FFT')
[XX YY]=size(Inew)

%Part 5
%Constructing Gaussian Filter of 9x9 size with for loop
size=9;
G=zeros(size);
x=size;
y=size;
part=(1/(2*pi*(0.8^2)));
for i=-4:4
    for j=-4:4 
        G(i+5,j+5)=part*exp(-((j^2)+(i^2))/(2*(0.8^2)));

    end
end





%Part 6
%Computing FFT of Gaussian Filter
fftGaus=fft2(G,30,30);

%Part 7
%Spatial and Frequency Illustration Of Gaussian
[X,Y] = meshgrid(-4:4);
[X1,Y1] = meshgrid(1:30);

figure()
mesh(X,Y,G)
figure()
mesh(X1,Y1,abs(fftshift(fftGaus)))

%part 8
%Convolution between New Image and Filter
convImage=conv2(Inew,G);

%part 9
%Product Of Image and Filter FFT's
%Frequency Multiplication of Image and Filter
%is equal to their Convolution in time.
fftImage=fftGaus.*fftInew;

%part 10
%Inverse Fast Fourier Transform 
ifftImage=ifft2(fftImage,30,30);





%Part 12
%Illustration Of 8,10,11 Steps
convCrop=imcrop(convImage,[5 5 29 29]);
figure()
imagesc(convImage)
colormap('gray')
title('Convolution Image')
figure()
imagesc(convCrop)
colormap('gray')
title('Convolution Image')
figure()
imagesc(ifftImage)
colormap('gray')
title('fft Image')



%Part 13
%Computing Mean Square Error For Steps 8,10,11

convImage_mse=MSE(Inew,convCrop)
ifft_mse=MSE(Inew,ifftImage)
ifft_conv_mse=MSE(convCrop,ifftImage)
%toepl_mse=ME(Inew,ToeplitzConv)



%Convolution With Toeplitz Matrx by using convmtx2().
Toeplitz=convmtx2(G,XX,YY);
length(Toeplitz)
ToeplitzConv = reshape(Toeplitz*Inew(:), size(G)+[30 30]-1);
figure()
imagesc(ToeplitzConv)
colormap('gray')
title('Toeplitz')




