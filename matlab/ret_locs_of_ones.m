function [out] = ret_locs_of_ones(list)
    out = 0;
    for i=1:length(list)
        if list(i)==1
            out(end+1) = i;
        end
    end
    out = out(2:end);
end