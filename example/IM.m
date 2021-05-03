% Iterative Methods class
% used to solve linear and non linear systems iteratively 
classdef IM
    methods (Static)
%=========================================================================%
                      % Gauss-Seidel Method
%=========================================================================%
function [x,w] = gauSei(A,b,n,x,imax,es,lambda)
    for i = 1:n
        dum = A(i,i);
        for j = 1:n
            A(i,j) = A(i,j)/dum;
        end
        b(i) = b(i)/dum;
    end
    for i = 1:n
        sum = b(i);
        for j = 1:n
            if i~= j
                sum = sum - A(i,j)*x(j);
            end
            x(i) = sum;
        end
    end
    iter = 1;
    sen = 0;
    L2norm_0 = norm(b-A*x);
    while sen == 0
        sen = 1;
        for i = 1:n
            old = x(i);
            sum = b(i);
            for j = 1:n
                if i~= j
                    sum = sum - A(i,j)*x(j);
                end
            end
            x(i) = lambda*sum + (1-lambda)*old;
            L2norm = norm(b-A*x);
            if sen == 1 && x(i) ~= 0
                ea = abs(L2norm/L2norm_0)/1;
                if ea > es
                    sen = 0;
                end
            end
            
        end
        iter = iter + 1;
        if iter >= imax
            break
        end
    end
    w = [lambda iter];
end
%=========================================================================%
                      % Newton-Raphson Method
%=========================================================================%        
function [q] = newRap(f,q,p,kmax)
    % f is the 'A' matrix
    % q is the 'b' vector
    % p is the precision goal
    % kmax is the maximum allowable iterations
    syms x1 x2 x3 x4 
    fp(x1,x2,x3,x4) = jacobian(f,[x1 x2 x3 x4]);
    b = transpose(double(f(q(1),q(2),q(3),q(4))));
    b_0 = b;
    k = 0;
     while (norm(b)/norm(b_0)) > 10^p && k<kmax
        A = double(fp(q(1),q(2),q(3),q(4)));
        b = transpose(double(f(q(1),q(2),q(3),q(4))));
        del = gauss(A,-b); % gauss elimination algorithm 
        q = q+del;
        k = k + 1;
     end
end

    end
end
