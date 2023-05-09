%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
function [quantized_image]=quantize(image,R)
    [x,y]=size(image);
    image_reshape=reshape(image,1,[]);
    imageQ=uni_scalar(image_reshape,x,R);
    quantized_image=reshape(imageQ,x,y);
end