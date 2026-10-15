% Size: 256x256, Grayscale
% Perform logical NOR and NAND operations between the two images

A = imread('images/paint1.jpg');
B = imread('images/paint2.jpg');

A = rgb2gray(A);
B = rgb2gray(B);

A = imbinarize(A);
B = imbinarize(B);

% operation
NAND = ~(A & B);
NOR  = ~(A | B);

subplot(2,2,1); imshow(A);    title('Image 1');
subplot(2,2,2); imshow(B);    title('Image 2');
subplot(2,2,3); imshow(NAND); title('NAND');
subplot(2,2,4); imshow(NOR);  title('NOR');

