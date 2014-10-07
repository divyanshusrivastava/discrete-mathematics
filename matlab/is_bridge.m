function [ non_bridge, bridge ] = is_bridge(adj, headers, vertex)
% the function takes input an adjacency matric 'adj' and a vertex 'v'
% and returnes the links which are bridges and links which are 
% non bridge independently. 
    
   non_bridge = [];
   bridge = [];
   disp('from is_bridge()');
   links = ret_locs_of_ones(adj(vertex,:))
   
   for i = 1:length(links)
       adj_xerox = adj;
       adj_xerox(vertex,links(i)) = 0;
       adj_xerox(links(i),vertex) = 0;
       
       if (check_connected(adj_xerox) == 1)
           non_bridge(end+1) = headers(links(i));
       elseif (check_connected(adj_xerox) == -1)
           bridge(end+1) = headers(links(i));
       end
       
   end
 

end