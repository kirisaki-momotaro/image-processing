clear all 
close all
%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
figure();
I = imread ('village.gif');
imshow (I, 'displayrange', []);

% Question 1
figure();

%Subplot image in various thresholds in order to decide which is optimal
for threshold=0:0.1:1
    subplot(3,4,threshold*10+1);
    IM=im2bw(I,threshold);
    imshow(IM);
    title(threshold)
end

%Choose threshold 0.19 as optimal
figure()
OptimalCase=im2bw(I,0.19);
imshow(OptimalCase);
title('Optimal Case')


% Question 2
figure();
count=1;
%Subplot image in various thresholds and winsizes in order to decide which is optimal
for winsize=3:2:13    
    for threshold=0.1:0.1:0.5
        subplot(6,5,count);
        IM=UrbanDetec('village.gif','C:\Users\chris\Desktop\project 1 tel411\project 6\detect\village.png',winsize,threshold);
        imagesc(IM,[30 250]);
        colormap(gray);
        
        theTitle1=strcat('winsize=', num2str(winsize));
        theTitle2=strcat(' threshold=', num2str(threshold));
        theTitle=strcat(theTitle1,theTitle2);
        title(theTitle);
        count=count+1
    end
end
figure()
OptimalCase=UrbanDetec('village.gif','C:\Users\chris\Desktop\project 1 tel411\project 6\detect\village.png',13,0.11);
imagesc(OptimalCase,[30 250]);
colormap(gray);
title('Optimal Case')

% Step 3
se=strel('disk',4); 

%Image Opening
erdi=imerode(I,se);
erdi=imdilate(erdi,se);

%Image Closing
dier=imdilate(I,se);
dier=imerode(dier,se);

open=erdi;
closed=dier;

%Top-Hat
TH=I-open;
%Normalisation
TH=im2double(TH);

%Bottom-Hat
BH=closed-I;
%Normalisation
BH=im2double(BH);

figure()
imshow(TH);
title('Top Hat')

figure()
imshow(BH);
title('Bottom Hat')

%Otsus Method Threshold
TTH = graythresh(TH);
TBH = graythresh(BH);

%To Binary
BWTH=im2bw(TH,TTH);
figure()
imshow(BWTH);
title('Binarized Top Hat')

%Open
BWTH=imopen(BWTH,se);


%To Binary
BWBH=im2bw(BH,TBH);

figure()
imshow(BWBH);
title('Binarized Bottom Hat')

%Close-Open
BWBH=imclose(BWBH,se);
BWBH=imopen(BWBH,se);

%Fuse
FusedIM=imfuse(BWTH,BWBH);
FusedIM=im2bw(FusedIM,0.19);
figure()
imshow(FusedIM);

title('Fused Image')
















%Use to plot each case in a different figure


% count=1;
% for winsize=3:2:13    
%     for threshhold=0.1:0.1:0.5
%         %subplot(5,5,count);
%         figure()
%         IM=UrbanDetec('village.gif','C:\Users\chris\Desktop\project 1 tel411\project 6\detect\village1.png',winsize,threshhold);
%         
%         imagesc(IM,[30 250]);
%         colormap(gray);
%         
%         theTitle1=strcat('winsize=', num2str(winsize));
%         theTitle2=strcat(' threshold=', num2str(threshhold));
%         theTitle=strcat(theTitle1,theTitle2);
%         title(theTitle);
%         count=count+1
%     end
% end
