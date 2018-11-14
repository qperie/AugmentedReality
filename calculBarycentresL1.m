function [barycentres] = calculBarycentresL1(L1)
% Pour chaque picot de l'image
% On récupère les coordonées de tous les points concernés dans L1
% On fait une moyenne de leurs coordonnées pour obtenir le barycentre du
% picot
% On stocke les coordonées X et Y de chaque barycentres dans un doublet

% Picot 1 : 2
[x1,y1] = find(L1 == 2);
moyXP1 = mean(x1);
moyYP1 = mean(y1);
baryP1 = [moyXP1 moyYP1];

% Picot 2 : 4
[x2,y2] = find(L1 == 4);
moyXP2 = mean(x2);
moyYP2 = mean(y2);
baryP2 = [moyXP2 moyYP2];

% Picot 3 : 3
[x3,y3] = find(L1 == 3);
moyXP3 = mean(x3);
moyYP3 = mean(y3);
baryP3 = [moyXP3 moyYP3];

% Picot 4 : 1
[x4,y4] = find(L1 == 1);
moyXP4 = mean(x4);
moyYP4 = mean(y4);
baryP4 = [moyXP4 moyYP4];

barycentres = [baryP1, baryP2, baryP3, baryP4]; 
% On renvoie une matrice contenant les 4 barycentres (un par picot)

end

