function [mat] = select(I)

figure, imshow(I)
[x,y] = ginput(2);
x = fix(x);
y = fix(y);

% Pour �viter les erreurs suite � une s�lection 
% faite dans le mauvais sens, 
% on distingue les diff�rents cas possibles
if x(1)>x(2)
    if y(1)>y(2)
        mat = I(y(2):y(1),x(2):x(1),:);
    else
        mat = I(y(1):y(2),x(2):x(1),:);
    end
else
    if y(1)>y(2)
        mat = I(y(2):y(1),x(1):x(2),:);
    else
        mat = I(y(1):y(2),x(1):x(2),:);
    end
end

end