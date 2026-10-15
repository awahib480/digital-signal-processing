% Using image arithmetic, extract a region of interest from a grayscale image by multiplying it with a binary mask.

I = rgb2gray(imread('images/rgb1.jpg'));
I = imresize(I,[256 256]);

M = zeros(256,256);                 % Binary mask
M(80:180,80:180) = 1;              % Select ROI

ROI = I .* uint8(M);                % Extract ROI

subplot(1,3,1); imshow(I);   title('Original');
subplot(1,3,2); imshow(M);   title('Mask');
subplot(1,3,3); imshow(ROI); title('ROI');
