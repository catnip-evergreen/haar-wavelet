 % p_i,1 function
% x - argument
% i - index
function [y,m,k] = p(x,i,J)
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
end;
y = zeros([1 length(x)]);
if i == 1    
    for i = 1:length(x)
        if (0 <= x(i) && (x(i) < 1))
            y(i) = x(i);
        else
            y(i) = 0;
        end
    end
else
    alpha = k / m;
    beta = (k + 0.5) / m;
    gamma = (k + 1) / m;
    for i = 1:length(x)
        if (alpha <= x(i) && (x(i) < beta))
            y(i) = x(i) - alpha;
        elseif (beta <= x(i) && (x(i) < gamma))
            y(i) = gamma - x(i);
        else
            y(i) = 0;
        end
    end
end
