function D=Dmaha(image,covariance,moyenne)
image=double(image);
X_colR = reshape(image(:,:,1),[],1) - moyenne(1);
X_colG = reshape(image(:,:,2),[],1) - moyenne(2);
X_colB = reshape(image(:,:,3),[],1) - moyenne(3);
X = [X_colR, X_colG, X_colB];

Y = X * covariance^(-1);
Y = Y.' .* X.';
Y = sum(Y);

D = reshape(Y,size(image,1),size(image,2));
end