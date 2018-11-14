function [muPicot] = calculMoyenne(I)

muPicot = [0.0,0.0,0.0];
for i = 1:3
    Ii = I(:,:,i);       % image pour chaque couleur
    s = sum(sum(Ii));
    N = size(Ii,1)*size(Ii,2);
    muPicot(i)= s/N;
end

end
