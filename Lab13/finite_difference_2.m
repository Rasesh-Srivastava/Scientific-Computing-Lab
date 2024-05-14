function max_error = finite_difference_2(a, b_, alpha, beta, N, p, q, r, actual_f, disp_var, str, method)
    h = (b_-a)/(N+1);

    A = zeros(N, N);
    b = zeros(N, 1);
    
    for i = 1:N
        for j = (i-1):(i+1)
            if (j >= 1 && j <= N)
                x = a + j*h;
                if j == i-1
                    if method == 1
                        A(j, i) = -1 + h*p(x);
                    elseif method == 2
                        A(j, i) = -1 + 0.5*h*p(x);
                    else
                        A(j, i) = -1;
                    end
                elseif j == i
                    if method == 1
                        A(j, i) = 2 + h^2*q(x) - h*p(x);
                        if i == 1
                            A(j, i) = A(j, i) - 1;
                        elseif i == N
                            A(j, i) = A(j, i) - 1 + h*p(x);
                        end
                    elseif method == 2
                        A(j, i) = 2 + h^2*q(x);
                        if i == 1
                            A(j, i) = A(j, i) - 1 - 0.5*h*p(x);
                        elseif i == N
                            A(j, i) = A(j, i) - 1 + 0.5*h*p(x);
                        end
                    else
                        A(j, i) = 2 + h^2*q(x) + h*p(x);
                        if i == 1
                            A(j, i) = A(j, i) - 1 - h*p(x);
                        elseif i == N
                            A(j, i) = A(j, i) - 1;
                        end
                    end
                else
                    if method == 1
                        A(j, i) = -1;
                    elseif method == 2
                        A(j, i) = -1 - 0.5*h*p(x);
                    else
                        A(j, i) = -1 - h*p(x);
                    end
                end
            end
        end
    end

    

    for i = 1:N
        x = a + i*h;
        b(i) = -h^2*r(x);

        if i == 1
            if method == 1
                b(i) = b(i) - alpha*h;
            elseif method == 2
                b(i) = b(i) - alpha*h*(1 + 0.5*h*p(x));
            else
                b(i) = b(i) - alpha*h*(1 + h*p(x));
            end
        elseif i == N
            if method == 1
                b(i) = b(i) + beta*h*(1 - h*p(x));
            elseif method == 2
                b(i) = b(i) + beta*h*(1 - 0.5*h*p(x));
            else
                b(i) = b(i) + beta*h;
            end
        end
    end

   

    w = A \ b;

    w_final = [w(1) - alpha*h, w.', w(N) + beta*h];

    

    errs = zeros(1, N+2);
    actual_y = zeros(1, N+2);

    for i = 1:N+2
        actual_y(i) = actual_f(a+(i-1)*h);
        errs(i) = abs(w_final(i) - actual_y(i));
    end

    if disp_var == 1
        abc = figure('visible','on');
        plot(a:h:b_, actual_y, a:h:b_, w_final, 'Linewidth', 1);
        title(strcat('Actual solution and Approximate solution Plot for', str));
        xlabel('t')
        ylabel('y(t)');
        legend('Actual Solution', 'Approximate Solution', 'Location','northwest');
        %saveas(abc,'plot1.jpg');
        hold off;

        abc = figure('visible','on');
        plot(a:h:b_, errs, 'Linewidth', 1);
        title(strcat('Absolute Errors Plot for', str));
        xlabel('t')
        ylabel('|y_i(t) - y(t)|');
        %saveas(abc,'plot2.jpg');
        hold off;

        fprintf('For h = %.6f\n\tx\t\tApproximate Solution\tExact Solution\tAbsolute Error\n', h);
        for i = 1:N+2
            fprintf('%.6f\t\t%.7f\t\t\t  %.7f\t\t  %.7f\n',a + (i-1)*h, w_final(i), actual_y(i), errs(i));
        end
        fprintf('\n');
    end

    max_error = max(errs);
end