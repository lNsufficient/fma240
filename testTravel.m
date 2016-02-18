clear all;
disp('Task 2');
disp('D = travsalesmandata');
travsalesmandata;
[x fopt] = travsalesman(D)

disp('==============')
disp('Task 3');
disp('Cities in lecture 6, last page.')

D = [0, 6, 13, 3; 6 0 6 9; 13 6 0 4; 3 9 4 0];
[x fopt] = travsalesman(D)

disp('Lund, Uppsala, Göteborg, Borgeby, Norrköping')
D = [0 669 264 17.9 447;
    669 0 453 659 228;
    264 453 0 254 313;
    17.9 659 254 0 436;
    447 228 313 436 0];

[x fopt] = travsalesman(D)

disp('Rand')
jmax = 10;
mini = 4;
maxi = 14;
eltime = zeros(maxi-mini+1, 1);

for i = mini:maxi
    tic
    for j = 1:jmax
        D1 = rand(i, i);
        D0 = D1 - diag(diag(D1));
        D = D0+D0';
        [x fopt] = travsalesman(D);
    end
    eltime(i-mini+1) = toc/jmax;
end
figure(1);
plot(mini:maxi, eltime)
figure(2);
semilogy(mini:maxi, eltime)