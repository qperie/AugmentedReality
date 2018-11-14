function [barycentres] = calculBarycentres(L)
% Pour chaque picot de l'image (il y en a "m" ici)
% On r�cup�re les coordon�es de tous les points concern�s dans L
% On fait une moyenne de leurs coordonn�es pour obtenir le barycentre du
% picot
% On stocke les coordon�es X et Y de chaque barycentres dans une matrice
% receuillant tous les barycentres

m = max(max(L));
barycentres = zeros(1,m*2);

for i = 1:m
    [xi,yi] = find(L == i);
    moyXPi = mean(xi);
    moyYPi = mean(yi);
    baryPi = [moyXPi, moyYPi];
    barycentres(2*i-1:2*i) = baryPi;
end

end
