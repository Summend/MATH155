
img = imread ('Fig5.07(b).jpg');
img = mat2gray(img,[0 255]);
[m,n] = size(img);

for i = 1:1:m
    for j = 1:1:n
        f(i,j) = img(i,j);
        f2(i,j) = img(i,j);
    end
end

for i = 2:1:m-1
    for j = 2:1:n-1
        sum = 0;
        for p = i-1:1:i+1
            for q = j-1:1:j+1
                sum = sum + img(p,q);
            end
        end
        f(i,j) = sum/9;
    end
end

for i = 2:1:m-1
    for j = 2:1:n-1
        f2(i,j) = (img(i-1,j-1)*img(i-1,j)*img(i-1,j+1)*...
            img(i,j-1)*img(i,j)*img(i,j+1)*...
            img(i+1,j-1)*img(i+1,j)*img(i+1,j+1))^(1/9);
    end
end

ori = imread ('Fig5.07(a).jpg');
ori = mat2gray(ori,[0 255]);

SUM_1 = 0;
SUM_1_2 = 0;
SUM_2 = 0;
SUM_2_2 = 0;
SUM_ori = 0;
SUM_ori_2 = 0;

for i = 1:1:m
    for j = 1:1:n
        SUM_1 = SUM_1 + f(i,j)^2;
        SUM_1_2 = SUM_1_2 + (ori(i,j)-f(i,j))^2;
        
        SUM_ori = SUM_ori + img(i,j)^2;
        SUM_ori_2 = SUM_ori_2 + (ori(i,j)-img(i,j))^2;
        
        SUM_2 = SUM_2 + f2(i,j)^2;
        SUM_2_2 = SUM_2_2 + (ori(i,j)-f2(i,j))^2;
    end
end

SNR1 = 10 * log10(SUM_1/SUM_1_2)
SNR2 = 10 * log10(SUM_2/SUM_2_2)
SNR3 = 10 * log10(SUM_ori/SUM_ori_2)
        
subplot(2,2,1);
imshow(ori,[ ]);
xlabel('a).Original Image');

subplot(2,2,2);
imshow(img,[ ]);
xlabel({'b). Image with noise','SNR=14.1841'});

subplot(2,2,3);
imshow(f, [0 1]);
xlabel({'b).arithmetic mean filter','SNR=14.0472'});

subplot(2,2,4);
imshow(f, [0 1]);
xlabel({'c).geometric mean filter','SNR=14.0508'});

