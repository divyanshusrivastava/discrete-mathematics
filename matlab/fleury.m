function [result] = fleury (adj)
% This fuunction uses fleury's algorithm to return an Eularian trial in an
% Eularian Graph.
% it takes input an adjacency matrix only.

    
    clc;
    
    if (length(size(adj))~=2)
        error('Adjacency Matrix should be 2 Dimensional');
        
    elseif (max(size(adj)) ~= min(size(adj)))
        error('Adjecency Matrix should be square');
        
    else
       
        %%%%%
        % check if the graph has proper values
        %%%%%
        len = length(adj);
        
        %check if the graph is connected or not
        
        ret = check_connected(adj);
        
        if ret == 0 
            %% disconnected
            error('The graph is disconnected!!');
        end
        
                    
        % check if the graph will have circuit or path
        degrees = zeros(len,1);
        
        flag = 0;
        for i = 1:len
            degrees(i) = sum(adj(:,i));
            if (mod(degrees(i),2)~=0)
                flag = flag+1;
            end
        end

        
        if (flag == 0)
            disp('Computing Eularian Circuit');
            option = 1;
        elseif (flag == 2)
            disp('Computing Eularian path');
            option = 2;
        else
            error('The Graph can neither have Eularian circuit nor Eularian Path');
        end
        
        
        
        if option == 1
            %%%%
            % compute Eularian circuit, start from anywhere 
            stack = 1;
            reduced_adj = adj;
            
            paths = sum(sum(adj))/2;
            while(length(stack) ~= paths)
            
                links = ret_locs_of_ones(reduced_adj(stack(end),:));
            
                %% check if the link is a bridge
                for j=1:length(links)
                    adj_copy = adj;
                    adj_copy(stack(end),links(j)) = 0;
                    adj_copy(links(j),stack(end)) = 0;
                    adj_copy
                    ret = check_connected(adj_copy);
                    
                    
                    
                    if ret == 1
                        %the link was not a bridge, therefore, can be
                        %considered
                        break;
                    end
              
                end
                if (ret == 1)
                    %  not a bridge
                    reduced_adj(stack(end),links(j)) = 0;
                    reduced_adj(links(j),stack(end)) = 0;
                    reduced_adj
                    stack
                    links
                    
                    stack (end+1) = links(j);

                    
                elseif(ret == -1)
                    % all the links are bridge
                    reduced_adj(stack(end),links(j)) = 0;
                    reduced_adj(links(j),stack(end)) = 0;                   
                    stack(end+1) = links(j);
                    disp('gone here')

                    
                end
                
                
              
           
            end
        elseif option == 2
            %%%%
            % compute Eularian Path, start from one of the vertex
            % containing odd degree.
            
            
            
        end
        
        
        
        % http://www.ctl.ua.edu/math103/euler/howcanwe.htm
        result = stack;
        
    end
    
end

