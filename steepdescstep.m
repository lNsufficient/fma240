function [xout,lokmin]=steepdescstep(problem,xin)
% One step in local search
% Input:
%   problem - The optimization problem.
%   xin     - a point in the domain of problem.
% Output:
%   xout    - the neighbour to xin with the lowest
%             goal function.
%   lokmin  - 1 if xin is a local minimum, 0 otherwise

% Generate all neighbours to xin.
	neighbours=getneighbours(problem,xin);
	lokmin=1;
	f=evaluate(problem,xin);
	xout=xin;
    fmin = f;
	for ii=1:size(neighbours,1);
		y=neighbours(ii,:);
		fnew=evaluate(problem,y);     
        if fnew < f
            lokmin = 0;
        end
        %if (fnew < fmin || ii == 1) %Om man ska ge den minsta grannen
        if (fnew < fmin)
            fmin = fnew;
            xout = y;
        end
	end
end

