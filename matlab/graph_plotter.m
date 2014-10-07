function graph_plotter(adj)

clc;
close all;

%load('adj');

L = length(adj);
theta = (360/L);
temp = zeros(1,L);

x = zeros(1,L);
y = zeros(1,L);

labels = {'a','b','c','d','e','f','g','h','i','j','k','l'};


for i = 1:L
x(i) = cosd(i*theta);
y(i) = sind(i*theta);
end

figure (1);
plot(x,y,'rh');
hold on
for i=1:L
text(x(i),y(i),labels{i},'VerticalAlignment','bottom','HorizontalAlignment','right');
end
for i=1:L
   temp = adj(i,:);
   for j=1:L
      if (temp(j)~=0)
         plot([x(i),x(j)],[y(i),y(j)],'b.-') ;
      end
   end
end


%scheduler(adj);
end