close all;
clear all;
clc;

img = imread ('Fig5.26a.jpg');
[m,n] = size(img);
f = zeros(m,n);

for i=1:m
    for j=1:n
        f(i,j)=img(i,j)+ (100*sin(2*pi*134.4*i));
    end
end

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_NF = ones(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = 30;
        
        v_k = 0; u_k = 103;
        D_k = ((x+u_k)^2 + (y+v_k)^2)^(0.5);
        H_NF(x+(P/2)+1,y+(Q/2)+1) = H_NF(x+(P/2)+1,y+(Q/2)+1) * 1/(1+(D/D_k)^2);
        D_k = ((x-u_k)^2 + (y-v_k)^2)^(0.5);
        H_NF(x+(P/2)+1,y+(Q/2)+1) = H_NF(x+(P/2)+1,y+(Q/2)+1) * 1/(1+(D/D_k)^2);
        
        v_k = 0; u_k = 205;
        D_k = ((x+u_k)^2 + (y+v_k)^2)^(0.5);
        H_NF(x+(P/2)+1,y+(Q/2)+1) = H_NF(x+(P/2)+1,y+(Q/2)+1) * 1/(1+(D/D_k)^2);
        D_k = ((x-u_k)^2 + (y-v_k)^2)^(0.5);
        H_NF(x+(P/2)+1,y+(Q/2)+1) = H_NF(x+(P/2)+1,y+(Q/2)+1) * 1/(1+(D/D_k)^2);
        
     end
end

G_1 = H_NF .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);     

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
close all;

figure();
subplot(1,3,1);
imshow(img,[ ]);
xlabel('a).Original Image');

subplot(1,3,2);
imshow(f,[ ]);
xlabel('b).a with Sinusoidal Noise');

subplot(1,3,3);
imshow(log(1 + abs(F)),[ ]);
xlabel('c).Fourier spectrum of b');

figure();
subplot(1,2,2);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('e).Fourier spectrum of d');

subplot(1,2,1);
imshow(g_1,[ ]);
xlabel('d).Result image');
