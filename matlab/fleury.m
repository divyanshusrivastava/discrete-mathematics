function fleury (adj)
% This fuunction uses fleury's algorithm to return an Eularian trial in an
% Eularian Graph.
% it takes input an adjacency matrix (adj) only.

    
    clc;
%% Checking if the dimensions of the entered matrix
    if (length(size(adj))~=2)
        error('Adjacency Matrix should be 2 Dimensional');
        
    elseif (max(size(adj)) ~= min(size(adj)))
        error('Adjecency Matrix should be square');
        
    else
       
%% Checking if the matrix has proper values
        len = length(adj);
        
% check if the graph is connected or not        
        ret = check_connected(adj);        
        if ret == 0 
            % disconnected
            error('The graph is disconnected!!');
        end
        
                    
% check if the graph will have circuit or path
        figure(1)
        graph_plotter(adj);
        pause(1);
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
            headers = 1:length(adj);
            paths = (sum(sum(adj))/2)+1;
            labels = 'a' : 'l';
            while(length(stack) ~= paths)
             
                for k = 1:length(headers)
                   if headers(k) == stack(end)
                       break;
                   end
                end

                
                [non_bridge, bridge] = is_bridge(reduced_adj,headers,k);
                
                if (~isempty(non_bridge))
                    %  not a bridge
                    
                    for iter = 1:length(headers)
                        if headers(iter) == non_bridge(1)
                            break;
                        end
                    end
                    
                    
                    for iterator = 1:length(headers)
                        if headers(iterator) == stack(end)
                            reduced_adj(iterator,iter) = 0;
                            reduced_adj(iter,iterator) = 0;
                        end
                    end
                    stack (end+1) = non_bridge(1);
                    
                elseif(isempty(non_bridge) && ~isempty(bridge) && length(bridge)==1)
                    % all the links are bridge
                    stack(end+1) = (bridge(1));
                    
                    for iterator = 1:length(headers)
                        if headers(iterator) == stack(end-1)
                            headers(iterator) = [];
                            labels(iterator) = [];
                            reduced_adj(iterator,:) = [];
                            reduced_adj(:,iterator) = [];
                            break;
                        end
                    end
                end
            end
                
        elseif option == 2
            %%%%
            % compute Eularian Path, start from one of the vertex
            % containing odd degree.
            
            headers = 1:length(adj);
            reduced_adj = adj;
            paths = (sum(sum(adj))/2)+1;
            
            degrees = sum(adj);
            
            for check = 1:length(degrees)
                if mod(degrees(check),2) == 1
                    break;
                end
            end
            
            stack = check;
            
            while(length(stack)~=paths)
                for k = 1:length(headers)
                   if headers(k) == stack(end)
                       break;
                   end
                end

                
                [non_bridge, bridge] = is_bridge(reduced_adj,headers,k);
                
                if (~isempty(non_bridge))
                    %  not a bridge
                    for iter = 1:length(headers)
                        if headers(iter) == non_bridge(1)
                            break;
                        end
                    end
                    for iterator = 1:length(headers)
                        if headers(iterator) == stack(end)
                            reduced_adj(iterator,iter) = 0;
                            reduced_adj(iter,iterator) = 0;
                        end
                    end
                    stack (end+1) = non_bridge(1);
                    
                elseif(isempty(non_bridge) && ~isempty(bridge) && length(bridge)==1)
                    % all the links are bridge
                    stack(end+1) = (bridge(1));
                    for iterator = 1:length(headers)
                        if headers(iterator) == stack(end-1)
                            headers(iterator) = [];
                            reduced_adj(iterator,:) = [];
                            reduced_adj(:,iterator) = [];
                            break;
                        end
                    end
                end
            end
        end
        result = stack;
        fleury_plot(adj, result);
        disp('Generated result ');
        labels = {'A','B','C','D','E','F','G','H','I','J','K','L'};
        result_names = '.';
        for i = 1:length(result)
            result_names = strcat(result_names,'-->',labels(result(i)));
        end
        disp(char(result_names));
    end
end

