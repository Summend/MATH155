img=imread('Fig4.11(a).jpg');
[f1,f2] = freqspace(size(img),'meshgrid');
D = 25;
r = f1.^2+f2.^2;
Hh = ones(size(img));
for i=1:size(img,1)
    for j=1:size(img,2)
        t=r(i,j)/(D*D);
        Hh(i,j)=exp(-t);
    end
end

F=fft2(double(img));
F=fftshift(F);
Ya=F.*Hh;
Ya=ifftshift(Ya);
Ia=real(ifft(Ya));
figure, imshow(Ia)
