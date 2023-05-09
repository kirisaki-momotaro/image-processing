clear all;
close all
%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208


%Bonus Exercise

Fx=[-1,0,1];
Fy = rot90(Fx,1);


I=imread('lena_gray_512.tif');
%I=double(I);
Izero=padarray(I,[1 1]);

Iconvx=conv2(Izero,Fx);
Iconvy=conv2(Izero,Fy);
Iconvx = imcrop(Iconvx,[2 2 511 511]);
Iconvy = imcrop(Iconvy,[3 2 513 511]);

figure()
imshow(uint8(Iconvx));
figure()
imshow(uint8(Iconvy));

size(Iconvx)
size(Iconvy)
res=Iconvx+Iconvy;

    figure()
    imshow(res);
    
    
    
        