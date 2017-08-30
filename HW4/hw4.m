% read the original image
I=imread('Fig3.37(a).jpg');

% B is the output of the image
B=I;

% Since we want the boundary pixels to be unchanged, we adjust the size
% of our loop to be M/N-2 and start with (2,2)

for i= 2:size(I,1)-2
    for j=2:size(I,2)-2
        % create a mask for the median filter
        mask=zeros(9,1);
        % create an iterator for the mask
        inc=1;
        % we are using a 3*3 mask here
        for x=1:3
            for y=1:3
                % assin values in the mask by the original image
                mask(inc)=I(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
        % sort the mask, and get the median value of the mask, which
        % is the fifth element is a sorted list
        median=sort(mask);
        B(i,j)=median(5);  
    end
end

B=uint8(B);
subplot(1,2,1)
imshow(uint8(I))
subplot(1,2,2)
imshow(uint8(B))