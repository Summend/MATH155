img = imread ('Fig5.26a.jpg');
f = fft2(img);
f = fftshift(f);

margin = log(abs(f));
phase = log(angle(f)*180/pi);
l = log(f);

subplot(2,2,1)
imshow(uint8(img))
subplot(2,2,2)
imshow(l,[])
subplot(2,2,3)
imshow(margin,[])
subplot(2,2,4)
imshow(phase,[])

g = fft2(img);
M = mean2(img);
g(1,1) / (size(img,1)*size(img,2))
% the average is 138.0044

