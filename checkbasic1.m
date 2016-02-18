function [tableau,x,basic,feasible,optimal]=checkbasic1(A,b,c,basicvars);
% [tableau,x,basic,feasible,optimal]=checkbasic1(A,b,c,basicvars),
% INPUT: A - mxn matrix
%       b - mx1 matrix
%       c - nx1 matrix
%       basicvars - list of m indices between 1 and n.
% OUTPUT
%       tableau - the (m+1) x (n+1) matrix representing the simplex tableau
%               (skip the column corresponding to the objective function z)
%       x - nx1 matrix. The basic solution corresponding
%               to basic variables basicvars.
%       basic - 1 if x is a basic solution
%       optimal - 1 if x is an optimal solution
%       feasible - 1 if x is a feasible solution
% to the LP-problem in canonical form
% max z = c'*x
% subject to A*x=b, x>=0
[m,n] = size(A);
Ab = A(:,basicvars);

if (det(Ab)~= 0) % Check if there exists a solution.
    basic = 1;
        
    nonbasic =(1:n)';
    nonbasic(basicvars)=[];

    An = A(:,nonbasic);
    cb  = c(basicvars);
    cn = c(nonbasic);
    
    xb = Ab\b;
    x = zeros(n,1);
    x(basicvars) = xb;

    AbAn = Ab\An;
    Abb = Ab\b;

    aye = [eye(m,m); zeros(1,m)];
    
    tableau1 = [AbAn; cb'*(AbAn)-cn'];
    tableau = [zeros(m,n) Abb; zeros(1,n) cb'*(Abb)];
    tableau(:,basicvars) = aye;
    tableau(:,nonbasic) = tableau1;
    
    newC = tableau(end,1:end-1);
    
    if (min(xb) >= 0) 
        feasible = 1;
        if (min(newC) >= 0)
            optimal = 1;
        else
            optimal = 0;
        end
    else
        feasible = 0;
        optimal = 0;
    end
    
    
else
    basic = 0;
    feasible = 0;
    optimal = 0;
    x = zeros(n,1);
    tableau = zeros(m+1,n+1);
end

