a=imread('Fig4.11(a).jpg');
[m n]=size(a);
fim=fft2(a);
fshift=fftshift(fim);
p=m/2;
q=n/2;
d0=25;
for i=1:m
    for j=1:n
        dist=sqrt((i-p)^2+(j-q)^2);
        low_filter(i,j)=exp(-(dist)^2/(2*(d0^2)));
    end
end
filtered_low=fshift.*low_filter;
image_ori_low=ifftshift(filtered_low);
image_low=real(ifft2(image_ori_low));

for i=1:m
    for j=1:n
        dist=sqrt((i-p)^2+(j-q)^2);
        high_filter(i,j)=1-exp(-(dist)^2/(2*(d0^2)));
    end
end
filtered_high=fshift.*high_filter;
image_ori_high=ifftshift(filtered_high);
image_high=real(ifft2(image_ori_high));

subplot(2,2,1)
imshow(uint8(a))
subplot(2,2,2)
imshow(image_low,[])
subplot(2,2,3)
imshow(image_high,[])
