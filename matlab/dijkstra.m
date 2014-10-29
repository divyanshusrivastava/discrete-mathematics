function [pathout, pathoutcost] = dijkstra( A, s, d)

    A(find(A==0))=100000 ; %large value to denote no direct route existence 
    n=size(A,1);
    S(1:n) = 0;     %s, vector, set of visited vectors
    dist(1:n) = inf;   % it stores the shortest distance between the source node and any other node;
    prev(1:n) = n+1;    % Previous node, informs about the best previous node known to reach each  network node 

    dist(s) = 0;


    while sum(S)~=n %thr algo
        candidate=[];
        for i=1:n
            if S(i)==0
                candidate=[candidate dist(i)];
            else
                candidate=[candidate inf];
            end
        end
        [u_index u]=min(candidate);
        S(u)=1;
        for i=1:n
            if(dist(u)+A(u,i))<dist(i)
                dist(i)=dist(u)+A(u,i);
                prev(i)=u;
            end
        end
    end


    pathout = [d];

    while pathout(1) ~= s
        if prev(pathout(1))<=n
            pathout=[prev(pathout(1)) pathout];
        else
            error;
        end
    end;
    pathoutcost = dist(d);

    if(pathoutcost==100000)
        disp('no direct edge');
end