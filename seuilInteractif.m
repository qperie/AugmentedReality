function [ seuil, L1 ] = seuilInteractif(distMaha,seuilDepart,seuilMin,pasSeuil )

rep = 0;
seuil=seuilDepart;
se = strel('disk',1);
while rep == 0 && seuil > seuilMin
    % Seuillage de l'image
    imgSeuil = seuillage(seuil,distMaha);
    % Dilataiton des picots pour les lisser
    imgSeuil = imdilate(imgSeuil,se);
    % Labelisation
    L1 = bwlabel(imgSeuil,8);
    figure, imagesc(L1), colorbar
    % Demande de satisfaction
    Question = questdlg('Le seuil vous convient il ?','','Oui','Non','Non');
    rep = strcmp('Oui',Question);
    % Modification du seuil en conséquence
    if (rep == 0)
        seuil = seuil-pasSeuil;
    end
    close all
end

end

