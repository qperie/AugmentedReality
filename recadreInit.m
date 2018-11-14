function [subI] = recadreInit(I)

a = size(I,1)/2;
b = size(I,2)/2;
subI = imresize(I(a:a+a/2,b:b+b/2,:), 2);

end
