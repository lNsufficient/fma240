
disp('Example 1. p. 281')
c = [7;3;0;0]
A = [2 5 1 0; 8 3 0 1]
b = [30;48]
disp('Stem of tree')
basicvars = [3 4]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [3 1]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [2 1]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
disp('Optimal noninteger solution found. x1 = 4.41... x2 = 4.23... Gives optimum value 43.58 and so an upper bound for ILP is 43.')
disp('We use x1 as a branch variable. x1<= 4 or x1>= 5.')
disp('x1<=4')
A = [A zeros(2,1);1 0 0 0 1]
b = [b;4]
c = [c;0]
basicvars = [3 4 5]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [3 4 1]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [2 4 1]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
disp('Optimal noninteger solution found. Opt. value = 41.2. Upper bound for this branch is 41.2. Leave this node for now (dangling node)')
disp('Investigate the other branch. x1>= 5')
c = [7;3;0;0;0]
A = [2 5 1 0 0; 8 3 0 1 0;1 0 0 0 -1]
b = [30;48;5]
basicvars = [3 4 1]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [3 2 1]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
disp('Optimal noninteger solution found. Opt. value = 43>41.2, so this branch seems more promising. Continue with this one and keep the other one as a dangling node.')
disp('Use x2 as the branching variable. Two branches, x2<=2 and x2>=3')
disp('x2<=2:')
c = [7;3;0;0;0;0]
A = [2 5 1 0 0 0; 8 3 0 1 0 0;1 0 0 0 -1 0; 0 1 0 0 0 1]
b = [30;48;5;2]
basicvars = [3 4 1 6]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [3 4 1 2]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [3 5 1 2]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
disp('Optimal noninteger solution found. z= 42.75. Dangling node')
disp('Other branch: x2>=3')
c = [7;3;0;0;0;0]
A = [2 5 1 0 0 0; 8 3 0 1 0 0;1 0 0 0 -1 0; 0 1 0 0 0 -1]
b = [30;48;5;3]
basicvars = [3 4 1 2]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
feasible
disp('This problem is infeasible. This is a terminal node')
disp('Go back to the dangling node corresponding to x2<=2')
disp('Use x1 as a new branching variable: x1<= 5 or x1>=6.')
disp('x1<=5')
c = [7;3;0;0;0;0;0]
A = [2 5 1 0 0 0 0; 8 3 0 1 0 0 0;1 0 0 0 -1 0 0; 0 1 0 0 0 1 0;1 0 0 0 0 0 1]
b = [30;48;5;2;5]
basicvars = [3 4 1 6 7]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [3 4 1 2 7]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
basicvars = [3 4 1 2 5]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
disp('Optimal integer solution is found for this branch. It has value 41.')

disp('Other branch x1>=6')
c = [7;3;0;0;0;0;0]
A = [2 5 1 0 0 0;8 3 0 1 0 0 ;1 0 0 0 -1 0;0 1 0 0 0 1]
b = [30;48;6;2]
basicvars = [3 4 1 6]
[tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
tableau
disp('Optimal integer solution is found for this branch. It has value 42 which is the highest so far.')

disp('Look at other dangling branches. We have only one. The LP problem has value 41.2 < 42. No need to look at this branch. It is cut off.')

% disp('We can use the same method for Example 1. p. 265 using Branch and bound instead of the cutting plane method that was used for this problem in Lecture 5')
% disp('Stem of tree')
% c = [5;6;0;0]
% A = [10 3 1 0;2 3 0 1]
% b = [52;18]
% basicvars = [3 4]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% basicvars = [1 4]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% basicvars = [1 2]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% disp('Branch on x1 (x1<=4 or x1>= 5)')
% disp('x1<=4:')
% A = [A zeros(2,1);1 0 0 0 1]
% b = [b;4]
% c = [c;0]
% basicvars = [3 4 5]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% basicvars = [3 4 1]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% basicvars = [3 2 1]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% disp('integer optimum in this branch found. This branch ends here. Opt. value 40. Keep a note of this number for comparison.')
% disp('Branch x1>=5:')
% A = [10 3 1 0 0; 2 3 0 1 0;1 0 0 0 -1]
% b = [52;18;5]
% basicvars = [3 4 1]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% basicvars = [2 4 1]
% [tableau,x,basic,feasible,optimal] = checkbasic1(A,b,c,basicvars);
% tableau
% disp('Noninteger optimal solution found with z=29. This branch cannot contain the optimum since 29<40 (=previous integer optimum found in side branch)')
% disp('The branch is cut off here.')
% 
% disp('Optimal solution found for the full ILP problem. The value if 40.')
