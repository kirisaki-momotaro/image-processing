%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208

clear all;
close all;

%Part 1
I=imread('cameraman.tif');

%Part 2
Inew=imresize(I,[30 30]);

%Part3 
fftInew=fft2(Inew);
nifftImage=ifft2(fftInew,30,30);

figure()
imagesc(nifftImage)
colormap('gray')
title('New Part3')

%Part 4
figure()
imagesc(Inew)
colormap('gray')
title('New Image')

figure()
imagesc(abs(fftshift(fftInew)))
colormap('gray')
title('Image FFT')

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
fifftImage=ifft2(fftGaus,30,30);

figure()
imagesc(abs(fftshift(fftGaus)))
colormap('gray')
title('New reverse gaussian fourier')
figure()
imagesc(G)
colormap('gray')
title('New reverse gaussian')




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
ifftImage=ifft2(fftImage);

figure()
imagesc(ifftImage)
colormap('gray')
title('New Image')

cropConvImage=imcrop(convImage,[4 4 34 34]);

figure()
imagesc(cropConvImage)
colormap('gray')
title('New Image')

