function [ret] = check_connected(adj)
%%% this functions takes input an adjanecy matrix and checks if is a conncetd or not
    
    linked = zeros(length(adj),length(adj));

    for count = 1:length(adj)
        temp = adj^count;
        for i = 1:length(adj)
            for j = 1:length(adj)
                if (temp(i,j) ~= 0)
                    linked(i,j) = 1;
                end
            end
        end
        
    end
    
    
    flag = 0;
    for i = 1:length(adj)
        for j = 1:length(adj)
            if linked(i,j) == 0
                % disconnected
                flag = 1;
                break;
            end
        end
    end
    
    if flag == 0
       ret = 1; 
    elseif flag == 1
       ret = -1; 
    end
   
end