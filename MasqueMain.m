clc
clear all, close all

% Lecture du fichier vidéo puis de la 1ère image
V = VideoReader('vid_in.mp4');
image = read(V,120);

% Sélection d'une zone de main et affichage du carré de sélection
matMain = select(image);
figure, imshow(matMain);

% Calcul de la moyenne
mu = calculMoyenne(matMain);

% Calcul de la covariance
cov = calculCovariance(matMain, mu);

% Calcul de la distance de Maha
distMaha = calculDistMahaRapide(image,cov,mu);

% Seuillage
[seuil, imgLabel] = seuilInteractif(distMaha,1000,0,5);

%Enregitrement du modèle
main.mu = mu;
main.cov = cov;
main.seuil = seuil;
save('main.mat','main');
