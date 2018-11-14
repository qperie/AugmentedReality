function [D] = calculMatDistances(Bavant, Bapres)

s1 = size(Bavant,2)/2; 
% s1=4 car se sont les coordonnées des 4 picots sélectionnés à l'image précédente
s2 = size(Bapres,2)/2;
D = zeros(s1,s2);

for i = 1:s1 % Pour chaque picot de Bavant
    for j = 1:s2 % On calcule les distances avec tous les nouveaux picots potentiels
        D(i,j) = (Bavant(2*i-1)-Bapres(2*j-1))^2 + (Bavant(2*i)-Bapres(2*j))^2;
    end
end

end

