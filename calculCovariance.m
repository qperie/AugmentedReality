function [ covPicot ] = calculCovariance( I, mu)

covPicot =repmat([0.0],size(mu,2),size(mu,2));
N=size(I,1)*size(I,2);
for i = 1:size(mu,2)
    Ii = I(:,:,i);
    for j = 1:size(mu,2)
        Ij=I(:,:,j);
        s=0;
        for k = 1:size(I,1)
            for l =1:size(I,2)
                s=s+(Ij(k,l)-mu(j))*(Ii(k,l)-mu(i));
            end
        end
        covPicot(i,j)=double(s)/double(N);
    end
end

end

