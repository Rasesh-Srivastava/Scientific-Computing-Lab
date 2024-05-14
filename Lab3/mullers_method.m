function root = mullers_method(f,tol,a,b,x0,x1,x2)
    max_iter = 100;
    iteration = zeros(max_iter, 1);
    approximation_solution = zeros(max_iter, 1);
    errors = zeros(max_iter, 1);
    warning('off','all');
    figure;
    fplot(f, [a, b],'r');
    title('Function Plot of f(x)');
    xlabel('x');
    ylabel('f(x)');
    hold off;
    for iter = 1:max_iter
        w = ((f(x2)-f(x1))/(x2-x1)) + ((f(x2)-f(x0))/(x2-x0)) - ((f(x0)-f(x1))/(x0-x1));
        fx2x1x0 = (((f(x2)-f(x1))/(x2-x1))-((f(x0)-f(x1))/(x0-x1)))/(x2-x0);
        D = sqrt(w^2 - 4*f(x2)*fx2x1x0);
        if abs(w - D) < abs(w + D)
            E = w + D;
        else
            E = w - D;
        end
        h = -2 * f(x2) / E;
        p = x2 + h;
        iteration(iter) = iter;
        approximation_solution(iter) = p;
        errors(iter) = abs(h);
        if abs(h) < tol
            T = table(iteration(1:iter), approximation_solution(1:iter), errors(1:iter), 'VariableNames', {'No. of Iterations', 'Approximate solution', 'Error |X_n - X_n-1|'});
            disp(T);
            figure;
            loglog(1:iter, errors(1:iter), 'r');
            title('log-log plot of number of iterations n versus error');
            xlabel('Iteration Number n');
            ylabel('Error |X_n - X_n-1|');
            hold off;
            root = p;
            fprintf('Solution found after %d iterations\n',iter);
            fprintf('Solution is: %.8f + %.8fi.\n',real(root),imag(root));
            return;
        end
        x0 = x1;
        x1 = x2;
        x2 = p;
    end
    error('Muller''s method could not converge within the required tolerance in the given number of maximum iterations');
end
