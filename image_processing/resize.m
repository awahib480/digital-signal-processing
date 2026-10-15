% Read the color image ‘RGBBar.bmp’ given in the working directory. Find the size of the image, then resize it to 256×256.

A = imread("images/rgb1.jpg");
figure(1), imshow(A);

size(A);

B = imresize(A, [256, 256]);
figure(2), imshow(B);
