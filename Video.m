clc
clear all, close all

% Récupération du modèle de picot
load('modele.mat');
mu = modele.mu;
cov = modele.cov;
seuil = modele.seuil;

% Récpération du modèle de la main
load('main.mat');

% Chargement du fichier vidéo de base
V = VideoReader('vid_in.mp4');
nbImages = V.NumberOfFrames;

% Création du nouveua fichier vidéo
W = VideoWriter('vid_outF.avi');
open(W);

% Chargement de l'image à incruster
monImage = imread ('image.jpg');

% Travail sur la première image
image1 = read(V,1);
    % Seuillage et labelisation de l'image
distMaha1 = calculDistMahaRapide(image1,cov,mu);
imageS1 = distMaha1 < seuil;
L1 = bwlabel(imageS1,8);
    % Calcul des barycentres des picots
B1 = calculBarycentresL1(L1); 
xBary = [B1(2), B1(4), B1(6), B1(8)];
yBary = [B1(1), B1(3), B1(5), B1(7)];
    % Détermination du masque de la main
mask = zeros(520,576,3); % la main n'apparrait pas sur la première image
    % Incrustation de l'image
imgIncrust = motif2frame(monImage,image1,xBary,yBary,0.81, mask);
    % Enregistrement de l'image
writeVideo(W,imgIncrust);

% Travail pour les i images suivantes
for  i = 2:nbImages
    i %pour suivre l'avancé du programme
    imagei = read(V,i);
        % Seuillage et labelisation de l'image
    distMahai = calculDistMahaRapide(imagei,cov,mu);
    imageSi = distMahai < seuil;
    Li = bwlabel(imageSi,8);
    
        % Calcul des barycentres des picots
    % Stockage des coordonnées des barycentres de l'image précédente 
    % dans une variable Bavant
    if i == 2
        Bavant = B1;
    else
        Bavant = Bi;
    end
    
    % Calcul des nouveaux barycentres et des distances entre eux
    Bi = calculBarycentres(Li);
    matDist = calculMatDistances(Bavant, Bi);
    
    % Remise des barycentres dans le bon ordre et stockage
    Bi = reatributionBarycentres(Bi, matDist);
    xBary = [Bi(2), Bi(4), Bi(6), Bi(8)];
    yBary = [Bi(1), Bi(3), Bi(5), Bi(7)];
    
        % Détermination du masque de la main
    mask = double(maskMain(imagei,main.mu,main.cov,main.seuil));

        % Incrustation de l'image
    imgIncrust = motif2frame(monImage,imagei,xBary,yBary,0.81, mask);
    
        % Enregitrement dans la vidéo
    writeVideo(W,imgIncrust);

end

close(W);

% Lecture de la vidéo pour vérification du résultat
implay('vid_outF.avi');
