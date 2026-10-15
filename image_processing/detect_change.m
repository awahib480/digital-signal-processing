% Take two images of the same scene captured at different times and use image division (or subtraction) to detect the change between them.

I1 = rgb2gray(imread('images/before.jpg')); % before
I2 = rgb2gray(imread('images/after.jpg'));  % after

I1 = imresize(I1,[256 256]);         % Resize
I2 = imresize(I2,[256 256]);

D = imabsdiff(I1,I2);                % Difference

subplot(1,3,1); imshow(I1); title('Before');
subplot(1,3,2); imshow(I2); title('After');
subplot(1,3,3); imshow(D);  title('Change');
