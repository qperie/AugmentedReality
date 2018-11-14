clc
clear all, close all

% Lecture du fichier vid�o puis de la 1�re image
V = VideoReader('vid_in.mp4');
image = read(V,120);

% S�lection d'une zone de main et affichage du carr� de s�lection
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

%Enregitrement du mod�le
main.mu = mu;
main.cov = cov;
main.seuil = seuil;
save('main.mat','main');
