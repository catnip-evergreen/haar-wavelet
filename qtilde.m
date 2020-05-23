function [m, k] = qtilde(i,J)
  
if i == 1
    m = 0;
    k = 0;
else
    IMat = zeros([J+1 2^J]);
    IMask = IMat;
    ind_s = 1;
    for ind_j = 0:J    
        for ind_i = 0:2^ind_j-1
            ind_s = ind_s + 1;
            IMask(ind_j+1,ind_i+1) = ind_s;     
            IMat(ind_j+1,ind_i+1) = ind_i+ind_j+1;
        end; % for i
    end; % for j
    [m, k] = find(IMask == i);
    m = 2^(m - 1);
    k = k - 1;
end