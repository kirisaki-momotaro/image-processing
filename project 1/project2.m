clear all
%constructing filter
A=[1 2 1; 2 4 2; 1 2 1];
K=(1/16)*A;
[M, N] = size(K);

%read image
Lena=imread('lena_gray_512.tif');

%zero padding
LenaPZero=padarray(Lena,[M-1 N-1]);

%boarder padding
LenaPBoarder= padarray(Lena,[M-1 N-1],'replicate');

%convolution 
LenaPZeroConv=Convolution(LenaPZero,K);
LenaPBoarderConv=Convolution(LenaPBoarder,K);
LenaPZeroConv2=conv2(LenaPZero,K);
LenaPBoarderConv2=conv2(LenaPBoarder,K);


%resize back to 512,512
LenaPZeroConv2 = imcrop(LenaPZeroConv2,[3 3 511 511]);
LenaPBoarderConv2 = imcrop(LenaPBoarderConv2,[3 3 511 511]);

MSE(Lena,LenaPZeroConv)
MSE(Lena,LenaPBoarderConv)
MSE(Lena,LenaPZeroConv2)
MSE(Lena,LenaPBoarderConv2)
PSNR(LenaPBoarderConv2,Lena)


% figure()
% imshow(LenaPBoarderConv);
