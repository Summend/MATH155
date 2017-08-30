% the code for the composite Laplacian Mask is shown below
% the method is explained in detail in the code comment

% read the original image
I=imread('Fig3.40(a).jpg');

% mask for the composite Lapalacian mask
w=[0 -1 0; -1 5 -1;0 -1 0];

% use the builtin convolution function to create the output image

%img = conv2(double(I),w,'same');
[x,y]=size(I);
g=zeros(x+2,y+2);
%then, store f within g
for i=1:x
    for j=1:y
        g(i+1,j+1)=I(i,j);
    end
end

%cycle through the array and apply the filter 
for i= 2:size(I,1)-2
    for j=2:size(I,2)-2
        img(i,j)=g(i,j)*w(1,1)+g(i+1,j)*w(2,1)+g(i+2,j)*w(3,1) ... %first column
        + g(i,j+1)*w(1,2)+g(i+1,j+1)*w(2,2)+g(i+2,j+1)*w(3,2)... %second column
        + g(i,j+2)*w(1,3)+g(i+1,j+2)*w(2,3)+g(i+2,j+2)*w(3,3);
    end
end

subplot(1,2,1)
imshow(uint8(I))
subplot(1,2,2)
imshow(uint8(img))
