function newton_method_2variables(maxNumberOfIterations, x0_1, x0_2, input_function)
    format long;
    x_bar = [x0_1;x0_2];
    syms x_1 x_2;
    F = jacobian(input_function, [x_1, x_2]);
    dx = F\transpose(input_function);
    counter = 0;
    fprintf('Iteration Number %d:\nFirst Component (x_1) = %f, Second Component (x_2) = %f\n\n', counter, x_bar(1), x_bar(2));
    iteration = [];
    error_values = [];
    error_values_1=[];
    error_values_2=[];
    while counter< maxNumberOfIterations
        if counter>maxNumberOfIterations
            break;
        end
        counter = counter + 1;
        x_new = double(x_bar - subs(dx, [x_1;x_2], x_bar));
        error = norm(x_new - x_bar);
        iteration = [iteration, counter];
        error_values = [error_values, error];
        error_values_1 = [error_values_1, abs(x_new(1)-x_bar(1))];
        error_values_2 = [error_values_2, abs(x_new(2)-x_bar(2))];
        fprintf('Iteration Numebr %d:\n(x_1) = %f, (x_2) = %f\nError = %f | Error in x_1 = %f | Error in x_2 = %f\n\n', counter, x_new(1), x_new(2), error,abs(x_new(1)-x_bar(1)),abs(x_new(2)-x_bar(2)));
        x_bar=x_new;
    end
    fprintf('Using Newton''s method, we get:\n');
    fprintf('First Component x_1 = %f\n', x_bar(1));
    fprintf('Second Component x_2 = %f\n', x_bar(2));
    fprintf('\nNumber of iterations done = %d\n', counter);
    figure;
    plot(iteration, error_values, '-s');
    title('Residue Plot');
    xlabel('Iteration number N');
    ylabel('Error');
    hold off
    figure;
    plot(iteration, error_values_1, '-s');
    title('Residue Plot for x_1');
    xlabel('Iteration number N');
    ylabel('Error');
    hold off
    figure;
    plot(iteration, error_values_2, '-s');
    title('Residue Plot for x_2');
    xlabel('Iteration number N');
    ylabel('Error');
    hold off
end