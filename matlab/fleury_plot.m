function fleury_plot(adj, result)
% This function takes input an adjacency matrix and a solved eularian trial
% in it, and plots the graph ste[p-by-step

   
    
    L = length(adj);
    theta = (360/L);
    %temp = zeros(1,L);

    x = zeros(1,L);
    y = zeros(1,L);

    labels = {'A','B','C','D','E','F','G','H','I','J','K','L'};


    for i = 1:L
        x(i) = cosd(i*theta);
        y(i) = sind(i*theta);
    end

    
    plot(x,y,'rh');
    hold on
    for i=1:L
        text(x(i),y(i),labels{i},'VerticalAlignment','bottom','HorizontalAlignment','right','fontWeight','bold');
    end
    
    for i = 1:length(result)-1
        plot([x(result(i)),x(result(i+1))],[y(result(i)),y(result(i+1))],'r.-','LineWidth',2);
        pause(0.5);
    end
    
end


