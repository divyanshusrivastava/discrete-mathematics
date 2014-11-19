function result = tri_gen_2( adj )
% This function computes second child of a triangulation of a polygon
% Method: It places (n+1) instead of n, and places n and joins it with n-1
% and n+1

    result = zeros(length(adj)+1,length(adj)+1);
    
    for i = 1:length(adj)
        for j = 1:length(adj)
            result(i,j) = adj(i,j);
        end
    end
    
    temp = result(end-1,:);
    result(end,:) = temp;
    result(:,end) = temp';
    
    result(end-1,:) = 0;
    result(:,end-1) = 0;
    
    result(end,end-1) = 1;
    result(end-1,end) = 1;
    
    result(end-1,end-2) = 1;
    result(end-2,end-1) = 1;

end
