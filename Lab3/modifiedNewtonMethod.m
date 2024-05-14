function modifiedNewtonMethod(x0,tolerance,f,df,df2,a,b)
    warning('off','all');
    figure;
    fplot(f,[a,b],'r')
    xlabel('x')
    ylabel('f(x)')
    title('function plot of f(x)')
    hold off
    X = [];
    N = [];
    xn = x0;
    X(end+1) = x0;
    iterations = 0;
    while true
        xn1 = xn - (f(xn)*df(xn))/(df(xn)*df(xn) - f(xn)*df2(xn));
        if abs(xn1 - xn) < tolerance
            break;
        end
        xn = xn1;
        iterations = iterations + 1;
        X(end+1) = xn;
        N(end+1) = iterations;
    end
    i=1;
    resi = [];
    while i <= iterations
        resi(end+1) = abs(X(i+1)-X(i));
        i=i+1;
    end
    fprintf('No. of iterations\t\tApproximate solution\t\tError |X_n - X_n-1|\n');
    fprintf('\t%d\t\t\t\t\t%.15f\t\t\t--\n',0,X(1));
    s=1;
    while s <= iterations
        fprintf('\t%d\t\t\t\t\t%.15f\t\t\t%.15f\n',s,X(s+1), resi(s));
        s =s+1;
    end
    figure;
    loglog(N,resi,'r');
    xlabel('n')
    ylabel('Error |X_n - X_n_-_1|')
    title('log-log plot of number of iterations n versus error')
    hold off
        fprintf('Solution found after %d iterations\n',iterations);
        fprintf('Solution is: %.8f\n', xn);
end