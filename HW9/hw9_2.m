I=imread('Fig10.15a.jpg');
w=[0 0 1 0 0
   0 1 2 1 0
   1 2 -16 2 1
   0 1 2 1 0
   0 0 1 0 0];
p = [0 0 3 2 2 2 3 0 0
     0 2 3 5 5 5 3 2 0
     3 3 5 3 0 3 5 3 3
     2 5 3 -12 -23 -12 3 5 2
     2 5 0 -23 -40 -23 0 5 2
     2 5 3 -12 -23 -12 3 5 2
     3 3 5 3 0 3 5 3 3
     0 2 3 5 5 5 3 2 0
     0 0 3 2 2 2 3 0 0]
img = conv2(double(I),w,'same');
img2 = conv2(double(I),p,'same');
[m,n] = size(img);

for i = 1:1:m
    for j =1:1:n
        if img(i,j)>=0
            f(i,j)=1;
        else
            f(i,j)=0;
        end
        if img2(i,j)>=0
            f2(i,j)=1;
        else
            f2(i,j)=0;
        end
    end
end

subplot(2,3,1)
imshow(uint8(I));
xlabel('a) original image');

subplot(2,3,2)
imshow(uint8(img));
xlabel('b) 5x5 LoG Filter')

subplot(2,3,3)
imshow(f,[0 1]);
xlabel('(c) Zero-crossong of b')

subplot(2,3,4)
imshow(uint8(img2));
xlabel('d) 9x9 LoG Filter')

subplot(2,3,5)
imshow(f2,[0 1]);
xlabel('(e) Zero-crossong of d')


