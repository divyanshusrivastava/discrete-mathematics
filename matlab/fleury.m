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
        
        %check if the graph is connected or not
        
        len = length(adj);
        something = adj^len;
        for i=1:len
            for j=1:len
                if something(i,j)==0
                    error('The entered matrix correxponds to a disconnected graph!!');
                end
            end
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
            
            
        elseif option == 2
            %%%%
            % compute Eularian Path, start from one of the vertex
            % containing odd degree.
            
            
            
        end
        
        
        
        % http://www.ctl.ua.edu/math103/euler/howcanwe.htm
        
    end
    
end

