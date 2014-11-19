function [ n, result ] = tri_gen_3( adj )
% This function computes children of the input adjacency matrix by
% decomposing the diagonals which involve the last vertex.
    
    locations = find(adj(end,:) == 1);
    
    if length(locations) == 2;
        n = 0;
        result = 0;
        return;
    end
    
    locations(1) = [];
    locations(end) = [];
    
    n = length(locations);
    
    result = zeros(length(adj)+1,length(adj)+1,n);
    
    for count = 1:n
        for i = 1:length(adj)
            for j = 1:length(adj)
                result(i,j,count) = adj(i,j);
            end
        end
        
        
        for i = 1:locations(count)
           if result(i,end-1,count) == 1
              result(i,end-1,count) = 0;
              result(end-1,i,count) = 0;
              result(i,end,count) = 1;
              result(end,i,count) = 1;
           end
        end
        
        result(1,end,count) = 1;
        result(end,1,count) = 1;
        
        result(end,end-1,count) = 1;
        result(end-1,end,count) = 1;
   
        result(end,locations(count),count) = 1;
        result(locations(count),end,count) = 1;
        
        result(end-1,locations(count),count) = 1;
        result(locations(count),end-1,count) = 1;
        
    end
end

