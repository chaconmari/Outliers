%reading data
data = dlmread('DataForOutlier.txt');

%getting distance and nearest neighbor
[n,d]=knnsearch(data,data,'k',2);

%deleteing the distance from itself
d(:,1) = [];

%to keep track of top 10 furthest from their neighbors
top = [0;0;0;0;0;0;0;0;0;0];

%lentgh for for loop
l = length(d);
l2 = length(top);

%keep track of the minimum value in the toplist
min2 = 0;
minloc2 = 1;

%keep track of which point is the furthest
neighborloc2 = [0;0;0;0;0;0;0;0;0;0];

%traverse thru distance matrix
for i = 1:l

   %if the new distance is greater than the min in the top10, then store
   %and traverse loop to set a new min
   if d(i,1)>min2
       top(minloc2)=d(i,1);
       min2 = d(i,1);
       neighborloc2(minloc2) = i;
       for j =1:l2
           if top(j)<min2
               min2 = top(j);
               minloc2=j;
           end
       end
   end
end
