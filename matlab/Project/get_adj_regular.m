function adjacency = get_adj_regular( n )
% This function generates the adjacency matrix of regular polygon for 'n'
% number of input sides.

    adjacency = zeros(n,n);
    
    for i = 1:n-1
        adjacency(i,i+1) = 1;
        adjacency(i+1,i) = 1;
    end
    
    adjacency(1,end) = 1;
    adjacency(end,1) = 1;
end

