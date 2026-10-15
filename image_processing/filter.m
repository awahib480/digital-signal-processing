% Sobel, Prewitt and Median filter

I = rgb2gray(imread('images/rgb1.jpg'));
I = imresize(I,[256 256]);

S = edge(I,'sobel');               % sobel filter
P = edge(I,'prewitt');             % prewitt filter
M = medfilt2(I);

subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(S); title('Sobel');
subplot(2,2,3); imshow(P); title('Prewitt');
subplot(2,2,4); imshow(M); title('Median');
