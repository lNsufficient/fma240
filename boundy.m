function bounds=boundy(x,D,minmax)
% function bounds=boundy(x,D,minmax);

%CREATED BY: EDVARD JOHANSSON, LINNÉA STÖVRING-NIELSEN

% calculates the 1x2 vector with lower and upper bound
% respectively,
% given the 1xn vector with the current path,
% the NxN distance matrix D and the Nx2 matrix
% minmax, where minmax(i,1) is the minimum distance
% from city i and minmax(i,2) is the maximum distance
% from city i.
minmax(x(1:end-1), :) = [];
if (size(minmax,1) == 1)
    minmax = [0, 0; 0, 0];
    x = [x, x(1)];
end
startDistance = sum(diag(D(x(1:(end-1)),x(2:end))));
bounds = startDistance + sum(minmax);
end


