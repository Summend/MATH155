img = imread ('Fig5.26a.jpg');
[m,n] = size(img);
r = zeros(m,n);

for i=1:m
    for j=1:n
        r(i,j)=img(i,j)+ (100*sin(2*pi*134.4*i));
    end
end

[m,n]=size(r);
imshow(r);title('original pic');
y=fft2(r);
y0=abs(y);
figure,imshow(y0,[]);title('frequency domain');
g=fftshift(y);
figure,imshow(abs(g),[]);title('central shift');
y1=log(1+abs(g));
figure,imshow(y1,[]);title('log');

for u=1:m
    for v=1:n
        d11=((u-128)^2+(v-24)^2)^(1/2);
        d12=((u-128)^2+(v-232)^2)^(1/2);
        d10=3;
        H1(u,v)=1/(1+(d10*d10/(eps+d11*d12))^2);
    end
end
g1=g.*H1;
for u=1:m
    for v=1:n
    d21=((u-128)^2+(v-72)^2)^(1/2);
    d22=((u-128)^2+(v-184)^2)^(1/2);
    d20=3;
    H2(u,v)=1/(1+(d20*d20/(eps+d21*d22))^2);
    end
end

g2=g1.*H2;

ff=ifft2(g2);figure,imshow(abs(ff),[]);title('freq filter');
