function fixedPointIteration(x0,g,tol,f,a,b)
    warning('off','all');
    figure;
    fplot(f,[a,b],'r')
    xlabel('x')
    ylabel('f(x)')
    title('function plot of f(x)')
    hold off
    figure;
    fplot(g,[a,b],'r')
    xlabel('x')
    ylabel('g(x)')
    title('function plot of g(x)')
    hold off
    maxIter = 1000;
    X = [];
    N = [];
    x = x0;
    X(end+1) = x0;
    iter = 0;
    while iter < maxIter
        temp=x;
        x = g(x);
        iter = iter + 1;
        X(end+1) = x;
        N(end+1) = iter;
        if abs(x-temp) <= tol
            break;
        end
    end
    i=1;
    resi = [];
    while i <= iter
        resi(end+1) = abs(X(i+1)-X(i));
        i=i+1;
    end
    fprintf('No. of iterations\t\tApproximate solution\t\tError |X_n - X_n-1|\n');
    fprintf('\t%d\t\t\t\t\t%.15f\t\t\t--\n',0,X(1));
    s=1;
    while s <= iter
        fprintf('\t%d\t\t\t\t\t%.15f\t\t\t%.15f\n',s,X(s+1), resi(s));
        s =s+1;
    end
    figure;
    loglog(N,resi,'r');
    xlabel('n')
    ylabel('Error |X_n - X_n_-_1|')
    title('log-log plot of number of iterations n versus error')
    hold off
    fprintf('Solution found after %d iterations\n',iter);
    fprintf('Solution is: %.8f\n', x);
end
