%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208

clear all;
close all;

%Part 1
I=imread('cameraman.tif');

%Part 2
Inew=imresize(I,[30 30]);
downsized=Inew;

%Part3 
fftInew=fft2(Inew,30,30);


%Part 4
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
fftGaus=fft2(G,30,30);

%Part 7
[X,Y] = meshgrid(-4:4);
[X1,Y1] = meshgrid(1:30);

figure()
mesh(X,Y,G)
figure()
mesh(X1,Y1,abs(fftshift(fftGaus)))

%part 8
convImage=conv2(Inew,G);

%part 9
fftImage=fftGaus.*fftInew;

%part 10
ifftImage=ifft2(fftImage,30,30);



convCrop=imcrop(convImage,[5 5 29 29]);
figure()
imagesc(convImage)
colormap('gray')
title('New Image')
figure()
imagesc(convCrop)
colormap('gray')
title('New Image')
figure()
imagesc(ifftImage)
colormap('gray')
title('New Image')

MSE(convCrop,ifftImage)


Toeplitz=convmtx2(G,XX,YY);
length(Toeplitz)
ToeplitzConv = reshape(Toeplitz*Inew(:), size(G)+[30 30]-1);
figure()
imagesc(ToeplitzConv)
colormap('gray')
title('Toeplitz')





