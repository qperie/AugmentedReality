function [distMaha] = calculDistMahaRapide(image,cov,mu)

image=double(image);
X_colR = reshape(image(:,:,1),[],1) - mu(1);
X_colG = reshape(image(:,:,2),[],1) - mu(2);
X_colB = reshape(image(:,:,3),[],1) - mu(3);
X = [X_colR, X_colG, X_colB];

Y = X * cov^(-1);
Y = Y.' .* X.';
Y = sum(Y);

distMaha = reshape(Y,size(image,1),size(image,2));

end

