function result = get_catalan( n )
% GET_CATALAN This function takes input n (the number of sides of a regular
% polygon) and returns the number of distinct triangulations of the polygon.
% For n > 28, the result is not EXACT

    if (mod(n,1)) ~= 0
        error('Number of sides should be integral!');
    elseif (n < 1) 
        error('Number of sides should be positive!');
    elseif (length(n) ~= 1)
        error('Number of sides should be scalar, recieved vector/matrix');
    else
        result = (1/(n+1))*nchoosek(2*n,n);
    end

end

