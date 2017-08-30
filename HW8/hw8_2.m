I = imread ('Fig5.08(a).jpg');
I2 = imread ('Fig5.08(b).jpg');
I = mat2gray(I,[0 255]);
I2 = mat2gray(I2, [0 255]);

I_output = contrah(I,1.5);
I2_output = contrah(I2,-1.5);

figure();
subplot(2,2,1);
imshow(I,[ ]);
xlabel('a).Original Image');

subplot(2,2,2);
imshow(I_output, [0 1]);
xlabel({'b).contraharmonic filter','Q=1.5'});

subplot(2,2,3);
imshow(I2, [ ]);
xlabel('b).Original Image');

subplot(2,2,4);
imshow(I2_output, [0 1]);
xlabel({'b).contraharmonic filter','Q=-1.5'});

function f = contrah(img,Q)
    [m,n] = size(img);
    sum_1 = 0;
    sum_1_1 = 0;
    for i = 1:1:m-1
        for j = 1:1:n-1
            for p = -1:1:1
                for q = -1:1:1
                    if (i+p>0 && i+p < m-1 && j+q>0 && j+q < n-1 && ...
                        1+p>0 && 1+p < m-1 && 1+q>0 && 1+q<n-1)
                        pix1 = (img(i+p,j+q)).^(Q+1);
                        pix2 = (img(i+p,j+q)).^Q;
                        sum_1 = sum_1 + pix1;
                        sum_1_1 = sum_1_1 + pix2;
                    end
                end
            end
            f(i,j) = (sum_1/sum_1_1);
            sum_1 = 0;
            sum_1_1 = 0;
        end
    end
end


