I = imread('Fig3.08(a).jpg');
J = hist_eq(I);
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
histim(I)
subplot(2,2,3);
imshow( J );
subplot(2,2,4);
histim(J)

function J = hist_eq(img)
J = uint8(zeros(size(img,1),size(img,2)));
freq = zeros(256,1);
prob_f = zeros(256,1);
prob_c = zeros(256,1);
cum = zeros(256,1);
output = zeros(256,1);

for i=1:size(img,1)
    for j=1:size(img,2)
        val = img(i,j);
        freq(val+1) = freq(val+1)+1;
        prob_f(val+1) = freq(val+1)/(size(img,1)*size(img,2));
    end
end
sum = 0;
for i=1:size(prob_f)
    sum = sum + freq(i);
    cum(i) = sum;
    prob_c(i) = cum(i)/(size(img,1)*size(img,2));
    output(i) = round(prob_c(i)*255);
end

for i=1:size(img,1)
    for j=1:size(img,2)
        J(i,j) = output(img(i,j)+1);
    end
end
%plot(output)
end

function histim(img)
img = uint8(img);
[count,bin] = hist(img(:),0:255);
stem(bin,count,'Marker','none')

hAx = gca;
set(hAx, 'XLim',[0 255],'XTickLabel',[],'Box','On');

hAx2 = axes('Position',get(hAx,'Position'), 'HitTest','off');
image(0:255, [0 1], repmat(linspace(0,1,256),[1 1 3]), 'Parent',hAx2)
set(hAx2, 'XLim',[0 255], 'YLim',[0 1], 'YTick',[], 'Box','on')

set(hAx, 'Units','pixels')
p = get(hAx, 'Position');
set(hAx, 'Position',[p(1) p(2)+26 p(3) p(4)-26])
set(hAx, 'Units','normalized')

set(hAx2, 'Units','pixels')
p = get(hAx2, 'Position');
set(hAx2, 'Position',[p(1:3) 26])
set(hAx2, 'Units','normalized')

linkaxes([hAx;hAx2], 'x')
set(gcf, 'CurrentAxes',hAx)
end
