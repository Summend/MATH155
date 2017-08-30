I = imread('Fig5.26a.jpg');
[m,n] = size(I);
fc = zeros(m,n);
for x = 1:1:m
    for y = 1:1:n
        fc(x,y) = I(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc);
H = ones(m,n);
for u = 1:1:m
    for v = 1:1:n
        H(u,v) = 1/(pi*(0.1*u+0.1*v));
        H(u,v) = H(u,v) * sin((pi*(0.1*u+0.1*v))^(exp(-pi*1i*(0.1*u+0.1*v))));
    end
end

G = H .* F;
g = real(ifft2(G));
for x = 1:1:m
    for y = 1:1:n
        g(x,y) = g(x,y) * (-1)^(x+y);
    end
end
J = imnoise(g,'gaussian',0,v);

K = linspace(0.001,0.1,100);
error_a = zeros(1,100);
for i=1:length(K)
    % Generate restored Wiener filter
    W = conj(H)./(abs(H).^2 + K(i));
    % Apply filter
    G_f = fft2(J);
    F_f = W.*G_f;
    F_r = uint8(ifft2(F_f));
    % Calculate error
    error = real(uint8(I)) - real(F_r);
    error_a(i) = mean(error(:))^2;
end
[minErrorValue minErrorPos] = min(error_a);
idealK = K(minErrorPos);

for u = 1:1:m
    for v = 1:1:n
        if H(u,v) == 0
            F_t(u,v) = F_t(u,v);
        else
            F_t(u,v) = ((1/H(u,v))*((abs(H(u,v))^2)/(abs(H(u,v))^2+idealK)));
            F_t(u,v) = F_t(u,v) * G(u,v);
        end
    end
end
f_t = real(ifft2(F_t));
for x = 1:1:m
    for y = 1:1:n
        f_t(x,y) = f_t(x,y) * (-1)^(x+y);
    end
end
       

subplot(2,2,1);
imshow(I, [ ]);
xlabel('a) origina image');

subplot(2,2,2);
imshow(g,[ ]);
xlabel('b) image with motion blurring');

subplot(2,2,3);
imshow(J,[ ]);
xlabel('c) image with Gaussian noise');

subplot(2,2,4);
imshow(f_t,[ ]);
xlabel('d) image using Wiener Filter');


