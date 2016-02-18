example511;
transportmovie(s,d,c)

example512;
transportmovie(s,d,c)
%Result: cost = 1930;

example513;
transportmovie(s,d,c)

%%
a1 = [10 5 1 2 3 4 9];
a2 = [10 5 1 2 6 7 8 9];
a3 = [10 5 1 6 7 8 9];
a4 = [10 5 6 7 8 9];
a5 = [10 5 6 12 13 8 9];
a6 = [10 11 12 13 8 9];
a7 = [10 16 17 18 13 8 9];
a8 = [10 15 20 21 22 18 13 14 9];
a9 = [10 15 20 21 22 18 19 14 9];
a10 = [10 15 20 21 22 23 19 14 9];
maxflow;
%%
problem = demoproblem(tsp);
xin = randomindomain(problem);
[xut, steps, locmin] = steepdesc(problem, xin)
evaluate(problem, xin)
pause;
[dmin,fumin,res]=branchandbound(problem);
pause;
xin = dmin
[xut, steps, locmin] = steepdesc(problem, xin)

%Vi hittar olika lokala minima om vi kör flera gånger. 
%%
problem = demoproblem(vigcrypto);
xin = randomindomain(problem);
[xut, steps, locmin] = steepdesc(problem, xin)

pause;
[dmin,fumin,res]=branchandbound(problem);
pause;
xin = dmin
[xut, steps, locmin] = steepdesc(problem, xin)
