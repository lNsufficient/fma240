function X=branchy(x,N)
% function X=branchy(x,N);

%CREATED BY: EDVARD JOHANSSON, LINNÉA STÖVRING-NIELSEN

% returns the mx(n+1) matrix X where
% each row of X is a possible extension
% of the input path x.
% x is a 1xn vector, and N is the total number
% of cities in the problem
cities = 1:N;
cities(x)=[];
m = length(cities);
X = ones(m, 1)*[x 0];
X(:,end) = cities;
end