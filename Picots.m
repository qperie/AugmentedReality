clc
clear all, close all

% Lecture du fichier vid�o puis de la 1�re image
V = VideoReader('vid_in.mp4');
image = read(V,1);

% On recadre l'image pour que la s�lection soit plus facile
% Ici elle est recadr�e sur le picot en bas � droite
I = recadreInit(image);

% S�lection d'un picot et affichage du carr� de s�lection
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

%Enregitrement du mod�le
modele.mu = mu;
modele.cov = cov;
modele.seuil = seuil;
save('modele.mat','modele');
