function newton_method_3variables(tol, x0_1, x0_2, x0_3, input_function, Q_num)
    format long;
    syms x_1 x_2 x_3;
    x_bar = [x0_1; x0_2; x0_3];
    F = jacobian(input_function, [x_1, x_2, x_3]);
    dx = F \ transpose(input_function);
    counter = 0;
    fprintf('\nIteration Number %d:\nFirst Component (x_1) = %f, Second Component (x_2) = %f, Third Component (x_3) = %f\n\n', counter, x_bar(1), x_bar(2), x_bar(3));
    iteration = [];
    error_values = [];
    error_values_1=[];
    error_values_2=[];
    error_values_3=[];
    while true
        if counter>6 && Q_num == 1
            break;
        end
        counter = counter + 1;
        x_new = double(x_bar - subs(dx, [x_1; x_2; x_3], x_bar));
        error = norm(x_new - x_bar);
        iteration = [iteration, counter];
        error_values = [error_values, error];
        error_values_1=[error_values_1, abs(x_new(1)-x_bar(1))];
        error_values_2=[error_values_2, abs(x_new(2)-x_bar(2))];
        error_values_3=[error_values_3, abs(x_new(3)-x_bar(3))];
        max_error=max(x_new(1)-x_bar(1),max(x_new(2)-x_bar(2),x_new(3)-x_bar(3)));
        fprintf('Iteration Number %d:\n(x_1)= %f, (x_2)=%f, (x_3) = %f\nError = %f | Error in x_1 = %f| Error in x_2 = %f | Error in x_3 = %f\n\n', counter, x_new(1), x_new(2), x_new(3),error, abs(x_new(1)-x_bar(1)),abs(x_new(2)-x_bar(2)),abs(x_new(3)-x_bar(3)));
        x_bar = x_new;
        if error <= tol && Q_num==3
            break;
        end
        if error <= tol && Q_num==1
            break;
        end
    end
    fprintf('Using Newton''s method, we get:\n');
    fprintf('First Component x_1 = %f\n', x_bar(1));
    fprintf('Second Component x_2 = %f\n', x_bar(2));
    fprintf('Third Component x_3 = %f\n', x_bar(3));
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
    figure;
    plot(iteration, error_values_3, '-s');
    title('Residue Plot for x_3');
    xlabel('Iteration number N');
    ylabel('Error');
    hold off
end
