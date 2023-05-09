%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208

close all;
clear all;

%Part A
%1.)Uni_Scalar Function Construction

%2.)

%x=linspace(-255,255);
x=-255:255;
u1=uni_scalar(x,255,0);
u2=uni_scalar(x,255,1);
u3=uni_scalar(x,255,2);
u4=uni_scalar(x,255,3);
u5=uni_scalar(x,255,4);
u6=uni_scalar(x,255,5);
u7=uni_scalar(x,255,6);
u8=uni_scalar(x,255,7);
u9=uni_scalar(x,255,8);

figure()
stairs(x,u1);
figure()
stairs(x,u2);
figure()
stairs(x,u3);
figure()
stairs(x,u4);
figure()
stairs(x,u5);
figure()
stairs(x,u6);
figure()
stairs(x,u7);
figure()
stairs(x,u8);
figure()
stairs(x,u9);

%3.)

Lena=imread('lena_gray_512.tif');

%max_val=max(max(Lena))
%min_val=min(min(Lena))

im=reshape(Lena,1,[]);
%[M,N]=size(im);
%Is 0 the first bit??????????

Q1=uni_scalar(im,512,0);
resQ1=reshape(Q1,512,512);

Q2=uni_scalar(im,512,1);
resQ2=reshape(Q2,512,512);

Q3=uni_scalar(im,512,2);
resQ3=reshape(Q3,512,512);

Q4=uni_scalar(im,512,3);
resQ4=reshape(Q4,512,512);

Q5=uni_scalar(im,512,4);
resQ5=reshape(Q5,512,512);

Q6=uni_scalar(im,512,5);
resQ6=reshape(Q6,512,512);

Q7=uni_scalar(im,512,6);
resQ7=reshape(Q7,512,512);

Q8=uni_scalar(im,512,7);
resQ8=reshape(Q8,512,512);

Q9=uni_scalar(im,512,8);
resQ9=reshape(Q9,512,512);



figure()
imagesc(resQ1,[0 511]);
colormap(gray);
figure()
imagesc(resQ2,[0 511]);
colormap(gray);
figure()
imagesc(resQ3,[0 511]);
colormap(gray);
figure()
imagesc(resQ4,[0 511]);
colormap(gray);
figure()
imagesc(resQ5,[0 511]);
colormap(gray);
figure()
imagesc(resQ6,[0 511]);
colormap(gray);
figure()
imagesc(resQ7,[0 511]);
colormap(gray);
figure()
imagesc(resQ8,[0 511]);
colormap(gray);
figure()
imagesc(resQ9,[0 511]);
colormap(gray);

 %4.)
 %Computing Distortion 
 
 dist_1=immse(Lena,resQ1)
 dist_2=immse(Lena,resQ2)
 dist_3=immse(Lena,resQ3)
 dist_4=immse(Lena,resQ4)
 dist_5=immse(Lena,resQ5)
 dist_6=immse(Lena,resQ6)
 dist_7=immse(Lena,resQ7)
 dist_8=immse(Lena,resQ8)
 dist_9=immse(Lena,resQ9)

 
 %5.)
 %Plot distortion-rate function
 distortion=10*log10([dist_1,dist_2,dist_3,dist_4,dist_5,dist_6,dist_7,dist_8,dist_9]);
 bit_rate=[0,1,2,3,4,5,6,7,8];
 
 figure()
 plot(bit_rate,distortion);
 xlabel('Bit Rate');
 ylabel('Distortion (dB)');
 title('Distortion-Rate Curve');

 
 
 
%PART 2

%1 Load Video
xylophone_video=VideoReader('xylophone.mp4');


%2
frame_rate=xylophone_video.FrameRate
duration=xylophone_video.Duration
number_of_frames=frame_rate*duration

Width=xylophone_video.Width
Height=xylophone_video.Height

%3
counter=1;
while hasFrame(xylophone_video)
    
    frame = readFrame(xylophone_video);
    imshow(uint8(frame));
    title('Video at original framerate')
    pause(1/frame_rate)
    if(counter==50)
        frame50=frame;
    end
    counter=counter+1;
end

%4
frame50gray=rgb2gray(frame50);
figure()
subplot(2,1,1)
imshow(uint8(frame50));
title('frame 50')
subplot(2,1,2)
imshow(uint8(frame50gray));
title('frame 50 grayscale')



%PART 3
%resize image to 256x256
frame50gray = imresize(frame50gray,[256 256],'nearest');
figure()
imshow(uint8(frame50gray));
title('resized frame 50')
%apply a 2 level Haar transform
[a1,h1,v1,d1]=haar_transform(frame50gray);
[a2,h2,v2,d2]=haar_transform(a1);

%Quantization R=4
quantization_level=4;

h1Q=quantize(h1,quantization_level);
v1Q=quantize(v1,quantization_level);
d1Q=quantize(d1,quantization_level);
h2Q=quantize(h2,quantization_level);
v2Q=quantize(v2,quantization_level);
d2Q=quantize(d2,quantization_level);

%calculate entropy before quantization
h1_entropy=entropy_calculate(h1)
v1_entropy=entropy_calculate(v1)
d1_entropy=entropy_calculate(d1)
h2_entropy=entropy_calculate(h2)
v2_entropy=entropy_calculate(v2)
d2_entropy=entropy_calculate(d2)

%calculate entropy R=4
h1Q_entropy=entropy_calculate(h1Q)
v1Q_entropy=entropy_calculate(v1Q)
d1Q_entropy=entropy_calculate(d1Q)
h2Q_entropy=entropy_calculate(h2Q)
v2Q_entropy=entropy_calculate(v2Q)
d2Q_entropy=entropy_calculate(d2Q)

%calculate compresion ratio
h1_compresion_ratio=(h1_entropy/h1Q_entropy)*100
v1_compresion_ratio=(v1_entropy/v1Q_entropy)*100
d1_compresion_ratio=(d1_entropy/d1Q_entropy)*100
h2_compresion_ratio=(h2_entropy/h2Q_entropy)*100
v2_compresion_ratio=(v2_entropy/v2Q_entropy)*100
d2_compresion_ratio=(d2_entropy/d2Q_entropy)*100

%apply inverse Haar transform
a1Q=inverse_haar_transform2(a2,h2Q,v2Q,d2Q);
image=inverse_haar_transform2(a1Q,h1Q,v1Q,d1Q);

%PSNR
PSRN_R4=PSNR(image,frame50gray)

%entropy of the reverse transformed image
image_entropy=entropy_calculate(image)
frame50gray_entropy=entropy_calculate(frame50gray)
image_compresion_ratio=(frame50gray_entropy/image_entropy)*100


%show results
figure()
subplot(2,1,1)
imshow(uint8(frame50gray));
title('original image')
subplot(2,1,2)
imshow(uint8(image));
title('compresed image R=4')


MSE(image,frame50gray)












%Quantization R=3,5
quantization_layer_1=3;
quantization_layer_2=5;

h1Q=quantize(h1,quantization_layer_1);
v1Q=quantize(v1,quantization_layer_1);
d1Q=quantize(d1,quantization_layer_1);
h2Q=quantize(h2,quantization_layer_2);
v2Q=quantize(v2,quantization_layer_2);
d2Q=quantize(d2,quantization_layer_2);



%calculate entropy R=4
h1Q_entropy_R35=entropy_calculate(h1Q)
v1Q_entropy_R35=entropy_calculate(v1Q)
d1Q_entropy_R35=entropy_calculate(d1Q)
h2Q_entropy_R35=entropy_calculate(h2Q)
v2Q_entropy_R35=entropy_calculate(v2Q)
d2Q_entropy_R35=entropy_calculate(d2Q)


%calculate compresion ratio
h1_new_compresion_ratio=(h1_entropy/h1Q_entropy_R35)*100
v1_new_compresion_ratio=(v1_entropy/v1Q_entropy_R35)*100
d1_new_compresion_ratio=(d1_entropy/d1Q_entropy_R35)*100
h2_new_compresion_ratio=(h2_entropy/h2Q_entropy_R35)*100
v2_new_compresion_ratio=(v2_entropy/v2Q_entropy_R35)*100
d2_new_compresion_ratio=(d2_entropy/d2Q_entropy_R35)*100


%apply inverse Haar transform
a1Q=inverse_haar_transform2(a2,h2Q,v2Q,d2Q);
image_R35=inverse_haar_transform2(a1Q,h1Q,v1Q,d1Q);

%PSNR
PSRN_R35=PSNR(image_R35,frame50gray)

%entropy of the reverse transformed image
image_entropy=entropy_calculate(image_R35)
image_new_compresion_ratio=(frame50gray_entropy/image_entropy)*100
%show results
figure()
subplot(2,1,1)
imshow(uint8(frame50gray));
title('original image')
subplot(2,1,2)
imshow(uint8(image_R35));
title('compresed image R=3,R=5')


MSE(image_R35,frame50gray)









