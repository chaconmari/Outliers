%reading data
data = dlmread('DataForOutlier.txt');

%getting distance and nearest neighbor
[neighbors,distance] = knnsearch(data, data, 'k', 6);

%deleteing the distance from itself
distance(:,1) = [];

%to keep track of top 10 furthest from their neighbors
top5 = [0;0;0;0;0;0;0;0;0;0];

%lentgh for for loop
l = length(distance);
l2 = length(top5);

%for average of nearest neighbors
average = double(l);

%keep track of the minimum value in the toplist
min = 0;
minloc = 1;

%keep track of which point is the furthest
neighborloc = [0;0;0;0;0;0;0;0;0;0];

%traverse thru distance matrix
for i = 1:l

    %get average of all 5 neighbors
   average(i,1)= ((distance(i, 1)+ distance(i,2)+ distance(i,3)+ distance(i,4)+ distance(i,5))/5);

   %if the new distance is greater than the min in the top10, then store
   %and traverse loop to set a new min
   if average(i,1)>min
       top5(minloc)=average(i,1);
       min = average(i,1);
       neighborloc(minloc)= i;
       for j =1:l2
           if top5(j)<min
               min = top5(j);
               minloc = j;
           end
       end
   end
end
