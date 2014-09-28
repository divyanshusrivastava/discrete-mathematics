function [result] = fleury (adj)
% This fuunction uses fleury's algorithm to return an Eularian trial in an
% Eularian Graph.
% it takes input an adjacency matrix only.

    clear all;
    clc;
    
    if (length(size(adj))~=2)
        error('Adjacency Matrix should be 2 Dimensional');
        
    elseif (max(size(adj)) ~= min(size(a)))
        error('Adjecency Matrix should be square');
        
    else
       
        %check if the graph is connected or not
        % check if the graph will have circuit or path
        % http://www.ctl.ua.edu/math103/euler/howcanwe.htm
        
    end
    
end

