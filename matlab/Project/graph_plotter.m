function graph_plotter(adj)
% this function plots a graph for the entered adjacency matrix
% it assumes that the user has entered a valid adjacency matrix

    clc;
    close all;

    %load('adj');

    L = length(adj);
    theta = (360/L);
    %temp = zeros(1,L);

    x = zeros(1,L);
    y = zeros(1,L);

    labels = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'};


    for i = 1:L
        x(i) = cosd(i*theta);
        y(i) = sind(i*theta);
    end

    figure (1);
    plot(x,y,'rh');
    hold on
    for i=1:L
        text(x(i),y(i),labels{i},'VerticalAlignment','bottom','HorizontalAlignment','right','fontWeight','bold');
    end
    for i=1:L
       temp = adj(i,:);
       for j=1:L
          if (temp(j)~=0)
             plot([x(i),x(j)],[y(i),y(j)],'b.-','LineWidth',2) ;
          end
       end
    end


    %scheduler(adj);
end