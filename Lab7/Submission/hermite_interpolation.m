function [y,herm,hermDer] = hermite_interpolation(X, fx, fx1, flagval,qnum)
    syms x;
    n = length(X);
    z = zeros(2*n);
    herm(x) = x-x;
    DivDiffHermTable = zeros(2*n, 2*n);
    for i = 1:n
        z(2*i - 1) = X(i);
        z(2*i) = X(i);
        DivDiffHermTable(2*i - 1, 1) = fx(i);
        DivDiffHermTable(2*i, 1) = fx(i);
        DivDiffHermTable(2*i, 2) = fx1(i);
        if i~=1
            DivDiffHermTable(2*i-1,2) = (DivDiffHermTable(2*i-1,1) - DivDiffHermTable(2*i-2,1))/(z(2*i-1) - z(2*i-2));
        end        
    end
    for i = 3:2*n
        for j = 3:i
            DivDiffHermTable(i,j) = (DivDiffHermTable(i,j-1) - DivDiffHermTable(i-1,j-1))/(z(i) - z(i-j+1));
        end
    end
    fprintf('Newton''s Divided Differences Table for Hermite Interpolation\n');
    for i=1:2*n
       for j=1:2*n
           if qnum ~= 1
                fprintf('%012.8f\t\t', DivDiffHermTable(i,j));
           else
               fprintf('%.8f\t\t', DivDiffHermTable(i,j));
           end
       end
       fprintf('\n');
    end
    fprintf('\n');
    herm(x) = DivDiffHermTable(1,1) + x-x;
    facT = 1;
    for i = 2:2*n
        facT = facT * (x - z(i-1));
        herm(x) = herm(x) + DivDiffHermTable(i,i) * facT;
    end
    y = double(subs(herm,x,flagval));
    fprintf('The approximate value of f(%.2f) = %.12f\n', flagval, y);
    hermDer(x) = diff(herm,x,1);
end