img=imread('Fig4.11(a).jpg');
figure(1)
imshow(img)
[m n] = size(img);
f_transform=fft2(img);
f_shift=fft2(f_transform);
p=m/2;
q=n/2;
d0=25;
for j=1:m
    for j=1:n
        t=sqrt((i-p)^2+(j-q)^2);
        low_filter(i,j)=exp(-(t)^2/(2*(d0^2)));
    end
end
filter_apply = f_shift.*low_filter;
image_ori = ifftshift(filter_apply);
image_ori_apply = real(ifft2(image_ori));
figure(2)
imshow(image_ori_apply)
