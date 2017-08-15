%position of exit point of wire
wirepos1 = [60,7];
wirepos2 = [293,60];
wirepos3 = [7,240];
wirepos4 = [293,240];
%arry that the wire position will go into
wirepath1 = zeros(1,101);
wirepath2 = zeros(1,101);
wirepath3 = zeros(1,101);
wirepath4 = zeros(1,101);
%the string is tied to a piece that moves in the center. Each string moves
%to a point in a sqaure like so....
%(0,0)-----(0,17)
%|             |
%|             |
%(0,-17)---(17,-17)
fixedChange1 = [0,-17];
fixedChange2 = [17,-17];
fixedChange3 = [0,0];
fixedChange4 = [17,0];




for i = 1:101
    %moves from 60-160
    xPosition = (i+59);
    currentPosition = [xPosition,240];
    distanceMatrix1 = [currentPosition+fixedChange1;wirepos1];
    distanceMatrix2 = [currentPosition+fixedChange2;wirepos2];
    distanceMatrix3 = [currentPosition+fixedChange3;wirepos3];
    distanceMatrix4 = [currentPosition+fixedChange4;wirepos4];
    %find distances
    d1 = pdist(distanceMatrix1,'euclidean');
    d2 = pdist(distanceMatrix2,'euclidean');
    d3 = pdist(distanceMatrix3,'euclidean');
    d4 = pdist(distanceMatrix4,'euclidean');
    %save the distances in the arrays
    wirepath1(1,i)=d1;
    wirepath2(1,i)=d2;
    wirepath3(1,i)=d3;
    wirepath4(1,i)=d4;
end

x = 0:100;

figure;
plot(x,wirepath1,x,wirepath2,x,wirepath3,x,wirepath4);