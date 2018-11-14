function [newBi] = reatributionBarycentres(Bi, matDist)

[min1,ind1] = min(matDist(1,:));
[min2,ind2] = min(matDist(2,:));
[min3,ind3] = min(matDist(3,:));
[min4,ind4] = min(matDist(4,:));

newBary1 = Bi(2*ind1-1:2*ind1);
newBary2 = Bi(2*ind2-1:2*ind2);
newBary3 = Bi(2*ind3-1:2*ind3);
newBary4 = Bi(2*ind4-1:2*ind4);

newBi = [newBary1, newBary2, newBary3, newBary4];

end

