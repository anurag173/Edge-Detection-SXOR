%testing
%% input of images
close all
% enter the filename
filename='1.jpg';
% flag=1 -> black-white  and flag=2 -> gray-scale
flag=1;

img=imread(filename);
img_gray=rgb2gray(img);
figure
imshow(img_gray);
title('Original');
% figure

%% denoising
img_gray = imopen(img_gray, strel('rectangle', [3,3]));
%% b/w image edge detection
figure
if flag==1
    img_bw= round(img_gray ./ 255) ;
    img_edge_bit = (~sxor(img_bw)).*255 ;
    imshow(img_edge_bit);
end
%% grayscal image detection
if flag==2 
    img_edge_bit=(~bitplanes(img_gray,8)).*255;

    %  imwrite(img_edge_bit,['sxor/',filename]);
    imshow(img_edge_bit);
end
title('SXOR');
%% standard methods
img_canny=~edge(img_gray,'canny',0.125).*255;
img_sobel=~edge(img_gray,'sobel',0.125).*255;
img_prewitt=~edge(img_gray,'prewitt',0.125).*255;
% imwrite(img_edge_bit,['sobel/',filename]);
% imwrite(img_edge_bit,['prewitt/',filename]);
figure
imshow(img_sobel);
title('Sobel');
figure
imshow(img_prewitt);
title('Prewitt');
