function scheduler( adj )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


L=length(adj);
possible = 1:L;


master_list=[];

while(length(master_list)~=L)
list = [];
cancel_list = [];
while(~isempty(possible))
        list(end+1) = possible(1);
        master_list(end+1) = possible(1);
        

        possible = possible(2:end);

        cancel = ret_locs_of_ones(adj(list(end),:));

        for i=1:length(cancel)
            %cancel_list(end+1) = cancel(i);
            possible = possible(possible~=cancel(i));
            %if (~ismember(cancel(i),master_cancel_list) )
            if (~ismember(cancel(i),cancel_list) && (~ismember(cancel(i),master_list)))
                cancel_list(end+1) = cancel(i);
            end
        end


        for w = 1:length(list)

            if (~ismember(list(w),master_list))
                master_list(end+1)=list(w);
            end
        end
       

    
    
end

possible = cancel_list;

disp('Day schedule: ');

disp(list);


end

end

