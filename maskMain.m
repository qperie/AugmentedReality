function [ mask ] = maskMain( image, mu, cov, seuil )

distMaha = Dmaha(image,cov,mu);
mask = distMaha < seuil;

end

