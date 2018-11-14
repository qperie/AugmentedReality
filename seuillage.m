function [ imgSeuil ] = seuillage(seuil, newImg)

[m,n] = size(newImg);
imgSeuil = zeros(m,n);
for i = 1:m
	for j = 1:n
        if (newImg(i,j) < seuil)    %
            imgSeuil(i,j) = 1;      % Binarissation
        end                         %
	end
end

end