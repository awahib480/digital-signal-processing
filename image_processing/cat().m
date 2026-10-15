% Read any color image and separate it into its R, G and B planes. Display each plane
% individually using subplot. Then recombine the three planes using cat() to reconstruct the
% original image, and verify that the reconstructed image matches the original.

A = imread('images/rgb1.jpg');
RED = A(:,:,1);
GREEN = A(:,:,2);
BLUE = A(:,:,3);

subplot(5,1,1);
imshow(A);

subplot(5,1,2);
imshow(RED);

subplot(5,1,3);
imshow(GREEN);

subplot(5,1,4);
imshow(BLUE);

B = cat(3, RED, GREEN, BLUE);
subplot(5,1,5);
imshow(B);
