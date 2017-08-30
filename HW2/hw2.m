I=imread('Fig10.15a.jpg');
w=[0 0 -1 0 0
   0 -1 -2 -1 0
   -1 -2 16 -2 -1
   0 -1 -2 -1 0
   0 0 -1 0 0];
img = conv2(double(I),w,'same');


subplot(1,2,2)
imshow(uint8(img))
