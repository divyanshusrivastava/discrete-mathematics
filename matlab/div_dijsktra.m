%% Dijstra Algorithm
% This script runs Dijsktra's shortest path algorithm on the a pre-feeded 
% weights matrix of Airport Distances between cities of north India.
% It takes inputs the source and destinations of the user and returns the
% paths and the total effective distance.

clear all;
clc;

close all;

load('adj_airports.mat');

labels = {'Jammu','Leh','Srinagar','Amritsar','Chandigarh','Jaipur','Dharamshala','Shimla','Dehradun','Ludhiana','Jodhpur','Udaipur','Delhi'};

disp('LEGENDS');

for i = 1:length(labels)
    disp(strcat(int2str(i),'-->',labels(i)));
end

%% Taking input
source = input('Enter Source Point (1-13): ');
destination = input('Enter Destination Point (1-13) :');

%% Verifying input
if mod(source,1) ~= 0
    error('Source Index invalid!');
end

if mod(destination,1) ~= 0
    error('Destination Index invalid!');
end

if source<1 || source>13
    error('Source index out of Range!');
end

if destination<1 || destination>13
    error('Destination index out of range!');
end

disp(strcat('Computing route from-',labels(source),'(',int2str(source),')','-to-',labels(destination),'(',int2str(destination),')'));

%% Computing shortest path

if source == destination
    disp('Source and Destinations are the same.!');
else
    adj_airports(adj_airports == 0) = sum(max(adj_airports)*10) ; % a sufficiently large value
    n = size(adj_airports,1);
    S(1:n) = 0;     
    dist(1:n) = inf;   
    prev(1:n) = n+1;    

    dist(source) = 0;
    
    % Algorithm
    while sum(S) ~= n 
        candidate = [];
        for i = 1:n
            if S(i) == 0
                candidate = [candidate dist(i)];
            else
                candidate = [candidate inf];
            end
        end
        [u_index u] = min(candidate);
        S(u) = 1;
        for i = 1:n
            if(dist(u) + adj_airports(u,i)) < dist(i)
                dist(i) = dist(u) + adj_airports(u,i);
                prev(i) = u;
            end
        end
    end

    % Back tracing the path
    pathout = destination;

    while pathout(1) ~= source
        if prev(pathout(1)) <= n
            pathout = [prev(pathout(1)) pathout];
        else
            error;
        end
    end;
    
    pathoutcost = dist(destination);
    
    disp('Shortest Path: ');
    stepwise_dist = 0;
    for i = 1:length(pathout)
        if i ~= 1
            stepwise_dist = stepwise_dist + adj_airports(pathout(i-1),pathout(i));
        end
        disp(strcat(labels(pathout(i)),'~~',int2str(stepwise_dist)));
    end
    
    disp(strcat('Total Distance--',int2str(pathoutcost)));
end