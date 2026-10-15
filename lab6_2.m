A = imread("/MATLAB Drive/Lab6_DSP/images/rgb1.jpg");
figure(1), imshow(A);

size(A);

B = imresize(A, [256, 256]);
figure(2), imshow(B);
