%% GABRIEL LAME'S COUNTING OF TRIANGULATION
% This script uses Lame's modern method to get the number of triangulations
% of a regular polygon, and the uses an algorithm to draw all those
% possible triangulations. For simplicity in terms of exactness and
% execution time and memory constraints, the algorithm is not feeded with a polygon of more than
% 15 sides.

%%
clear all;
clc;
close all;

%% Taking a valid input
n = input('Enter the number of sides of the polygon: ');

if (mod(n,1)) ~= 0
    error('Number of sides should be integral!');
elseif (n < 3) 
    error('Number of sides should be positive, greater than 3!');
elseif (length(n) ~= 1)
    error('Number of sides should be scalar, recieved vector/matrix');
end

%% Simplicity conditions
if n>15
    disp('A smaller number ( < 15 ) recommended! ');
    input('Hit return to restart.');
    lame;
end
    
%% Generating Adjacency matrix of the regular polygon of n sides
adjacency = get_adj_regular(n);


%% Returning the number of triangulations
Pn = get_catalan(n-2); 
disp('Number of triangulations: ');
disp(Pn);

%% Computing triangulations
previous = [0 1 1;1 0 1;1 1 0];

catalans = zeros(1,n-2);
for i = 3:n
    catalans(i-2) = get_catalan(i-2);
end


for count = 4:n
% one cycle of this loop should return triangulations of count sided
% polygon, which should be equal to catalans(count-2)
    new = zeros(count,count,catalans(count-2));
    iterator = 1;
    for cat_count = 1:catalans(count-3)
    % one cycle of this loop should give all children of one of the
    % triangulation of count-1 sided polygon
        temp_adj = previous(:,:,cat_count);
        
        new(:,:,iterator) = tri_gen_1(temp_adj);
        iterator = iterator + 1;
        
        [number,mat] = tri_gen_3(temp_adj);
        for i = 1:number
           new(:,:,iterator) = mat(:,:,i);
           iterator = iterator+1;
        end
        
        new(:,:,iterator) = tri_gen_2(temp_adj);
        iterator = iterator + 1;
        

    end
    previous = new;
end

triangulations = previous;
%% Displaying the results

if n == 3
    graph_plotter(triangulations);
    set(findobj(gcf, 'type','axes'), 'Visible','off');
end



for i = 1:Pn
        graph_plotter(triangulations(:,:,i));
        set(findobj(gcf, 'type','axes'), 'Visible','off');
        pause(1);
end
