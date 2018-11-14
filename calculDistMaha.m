function [distMaha] = calculDistMaha(img,cov,mu)

m = size(img,1);
n = size(img,2);
I = double(img);
distMaha = zeros(m,n);
for i = 1:m
    for j = 1:n
        x = [I(i,j,1), I(i,j,2), I(i,j,3)];
        distMaha(i,j) = (x-mu)*(inv(cov))*transpose(x-mu);
    end
end

end


