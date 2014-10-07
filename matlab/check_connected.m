function [flag] = check_connected(adj)
% this functions takes input an adjanecy matrix and checks 
% if the associated graph is connected or disconnected
    
%% 
% checking if there exist a path between each pair of vertices by 
% constantly raising the power of adjacency upto its length and 
% checking if there exist a path or not

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
    
%%
% using the linked matrix to determine if the entire graph 
% is linked or not
    flag = 1;
    for i = 1:length(adj)
        for j = 1:length(adj)
            if linked(i,j) == 0 % disconnected
                
                flag = -1;
                break;
            end
        end
    end
    
    
   
end