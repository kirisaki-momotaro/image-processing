clear all 
close all
%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208


I = imread ('cell.tif');
imshow (I, 'displayrange', []);

%Part 1
%Contour detection
bin_im = edge(I,'sobel');


figure()
imagesc(bin_im);
colormap(gray);
title('Contour Detection')

%Part 2
%Contour Connection
%se = strel('ball',4,4);
se=strel('disk',4); 
dilatedI = imdilate(bin_im,se);
figure();
imshow(dilatedI);
title('Contour Connection')

%Part 3
%Filling of holes
BWdfill = imfill(dilatedI,'holes');
figure()
imshow(BWdfill);
title('Binary Image with Filled Holes')

%Part 4
%Delete the objects, which don't fit in the image
BWnobord = imclearborder(BWdfill,4);
figure()
imshow(BWnobord);
title('Image with the Entire Object')

%Smooth the Contour 
erodBWdfill = imerode(BWnobord,se);
figure()
imshow(erodBWdfill);
title('Image with Smooth Contour')



%Outline Original Image
BWoutline = bwperim(erodBWdfill);
Segout = I; 
Segout(BWoutline) = 255; 
figure()
imshow(Segout)
title('Outlined Original Image')








