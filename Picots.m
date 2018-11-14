clc
clear all, close all

% Lecture du fichier vidéo puis de la 1ère image
V = VideoReader('vid_in.mp4');
image = read(V,1);

% On recadre l'image pour que la sélection soit plus facile
% Ici elle est recadrée sur le picot en bas à droite
I = recadreInit(image);

% Sélection d'un picot et affichage du carré de sélection
matPicot = select(I);
figure, imshow(matPicot)

% Calcul de la moyenne
mu = calculMoyenne(matPicot);

% Calcul de la covariance
cov = calculCovariance(matPicot, mu);

% Calcul de la distance de Maha
distMaha = calculDistMahaRapide(image,cov,mu);

% Seuillage
[seuil, L1] = seuilInteractif(distMaha,1500,100,50);

%Enregitrement du modèle
modele.mu = mu;
modele.cov = cov;
modele.seuil = seuil;
save('modele.mat','modele');
