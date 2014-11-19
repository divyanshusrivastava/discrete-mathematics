function draw_polygon( n )
% DRAW_POLYGON This fucntion draws a regular polygon for given number of
% sides n
    
    if (mod(n,1)) ~= 0
        error('Number of sides should be integral!');
    elseif (n < 1) 
        error('Number of sides should be positive!');
    elseif (length(n) ~= 1)
        error('Number of sides should be scalar, recieved vector/matrix');
    else
        theta = 360/n;
        
        x = zeros(1,n);
        y = zeros(1,n);
        
        % TODO: LABELLING OF VERTICES
        
        for i = 1:n
            x(i) = cosd(i*theta + 90);
            y(i) = sind(i*theta + 90);
        end
        
        figure(1)
        clf;
        plot(x,y,'b.-','LineWidth',2);
        hold on;
        plot([x(1),x(end)],[y(1),y(end)],'b.-','LineWidth',2);
        set(findobj(gcf, 'type','axes'), 'Visible','off')
        
    end

end
