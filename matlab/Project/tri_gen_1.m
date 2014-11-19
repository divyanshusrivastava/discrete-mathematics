function result = tri_gen_1( adj )
% This function computes one of the child of a triangulation of a polygon
% Method: It places anothe vertex (n+1) and joins it with 1 and n

    result = zeros(length(adj)+1,length(adj)+1);
    
    for i = 1:length(adj)
        for j = 1:length(adj)
            result(i,j) = adj(i,j);
        end
    end
    
    result(end,end-1) = 1;
    result(end-1,end) = 1;
    
    result(1,end) = 1;
    result(end,1) = 1;

end

