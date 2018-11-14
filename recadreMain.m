function [subI] = recadreMain(I)

a = size(I,1)/2;
b = size(I,2)/2;
subI = imresize(I(a/2:a+a/4,b/2:b,:), 2);

end