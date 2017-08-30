img = imread ('Fig5.26a.jpg');
[m,n] = size(img);
B = zeros(m,n);

for i=1:m
    for j=1:n
        B(i,j)=img(i,j)+ (100*sin(2*pi*134.4*i));
    end
end

f = fft2(B);
fshift = fftshift(f);
margin = log(abs(fshift));
phase = log(angle(fshift)*180/pi);
l = log(fshift);


for u=1:m
    for v=1:n
        D0 = 10;
        D1 = ((u-128)^2+(v-24)^2)^0.5;
        D2 = ((u-128)^2+(v-72)^2)^0.5;
        D_1 = ((u-128)^2+(v-232))^0.5;
        D_2 = ((u-128)^2+(v-184))^0.5;
        H(i,j) = (1/(1+(D0/D1)^4))*(1/(1+(D0/D_1)^4))*(1/(1+(D0/D2)^4))*(1/(1+(D0/D_2)^4));
    end
end

A = ifft2(fshift .* H);
output = real(ifftshift(A));

subplot(2,3,1)
imshow(uint8(B))
subplot(2,3,2)
imshow(l,[])
subplot(2,3,3)
imshow(margin,[])
subplot(2,3,4)
imshow(phase,[])
subplot(2,3,5)
imshow(output,[])
subplot(2,3,6)
imshow(log(1+abs(output)),[])
