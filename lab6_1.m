A = imread("/MATLAB Drive/Lab6_DSP/images/rgb1.jpg");
figure(1), imshow(A);

B = rgb2gray(A);
figure(2), imshow(B);

imwrite(B, '/MATLAB Drive/Lab6_DSP/images/gray1.jpg', 'jpg');