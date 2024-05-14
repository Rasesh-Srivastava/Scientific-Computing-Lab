function output_file()
    clc
    fprintf('Question 1 Part a\n');
    fprintf('Using forward-difference formula, the table is:\n');
    fprintf('x\t\tf(x)\t\tf''(x)\n');
    fprintf('0.5\t\t0.4794\t\t%.4f\n',difference(0.5,0.6,0.4794,0.5646));
    fprintf('0.6\t\t0.5646\t\t%.4f\n',difference(0.6,0.7,0.5646,0.6442));
    fprintf('0.7\t\t0.6442\t\t  --\n\n');
    fprintf('Using backward-difference formula, the table is:\n');
    fprintf('x\t\tf(x)\t\tf''(x)\n');
    fprintf('0.5\t\t0.4794\t\t  --\n');
    fprintf('0.6\t\t0.5646\t\t%.4f\n',difference(0.5,0.6,0.4794,0.5646));
    fprintf('0.7\t\t0.6442\t\t%.4f\n\n',difference(0.6,0.7,0.5646,0.6442));

    fprintf('Question 1 Part b\n');
    fprintf('Using forward-difference formula, the table is:\n');
    fprintf('x\t\tf(x)\t\tf''(x)\n');
    fprintf('1.0\t\t1.0000\t\t%.4f\n',difference(1,1.2,1,1.2625));
    fprintf('1.2\t\t1.2625\t\t%.4f\n',difference(1.2,1.4,1.2625,1.6595));
    fprintf('1.4\t\t1.6595\t\t  --\n\n');
    fprintf('Using backward-difference formula, the table is:\n');
    fprintf('x\t\tf(x)\t\tf''(x)\n');
    fprintf('1.0\t\t1.0000\t\t  --\n');
    fprintf('1.2\t\t1.2625\t\t%.4f\n',difference(1,1.2,1,1.2625));
    fprintf('1.4\t\t1.6595\t\t%.4f\n\n',difference(1.2,1.4,1.2625,1.6595));

    fprintf('Question 2 Part a\n');
    syms f(x)
    f(x) = sin(x);
    x = [0.5,0.6,0.7];
    y = [0.4794, 0.5646, 0.6442];
    f_der = diff(f);
    f_dash_forward_approx = forward_diff(x, y);
    f_dash_backward_approx = backward_diff(x, y);
    h = x(2) - x(1);
    fprintf('In forward-difference table,\n');
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n', x(1), difference(0.5,0.6,0.4794,0.5646), f_der(x(1)), abs(f_der(x(1)) - f_dash_forward_approx(1)), (h / 2) * max_double_diff(f, x(1), x(2)));
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n\n', x(2),difference(0.6,0.7,0.5646,0.6442), f_der(x(2)), abs(f_der(x(2)) - f_dash_forward_approx(2)), (h / 2) * max_double_diff(f, x(2), x(3)));
    fprintf('In backward-difference table,\n');
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n', x(2),difference(0.5,0.6,0.4794,0.5646), f_der(x(2)), abs(f_der(x(2)) - f_dash_backward_approx(1)), (h / 2) * max_double_diff(f, x(1), x(2)));
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n', x(3),difference(0.6,0.7,0.5646,0.6442), f_der(x(3)), abs(f_der(x(3)) - f_dash_backward_approx(2)), (h / 2) * max_double_diff(f, x(2), x(3)));
    fprintf('\n');

    fprintf('Question 2 Part b\n');
    syms f(x)
    f(x) = (x ^ 2) * log(x) + 1;
    x = [1, 1.2, 1.4];
    y = [1, 1.2625, 1.6595];
    f_der = diff(f);
    f_dash_forward_approx = forward_diff(x, y);
    f_dash_backward_approx = backward_diff(x, y);
    h = x(2) - x(1);
    fprintf('In forward-difference table,\n');
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n', x(1), difference(1,1.2,1,1.2625), f_der(x(1)), abs(f_der(x(1)) - f_dash_forward_approx(1)), (h / 2) * max_double_diff(f, x(1), x(2)));
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n\n', x(2),difference(1.2,1.4,1.2625,1.6595), f_der(x(2)), abs(f_der(x(2)) - f_dash_forward_approx(2)), (h / 2) * max_double_diff(f, x(2), x(3)));
    fprintf('In backward-difference table,\n');
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n', x(2),difference(1,1.2,1,1.2625), f_der(x(2)), abs(f_der(x(2)) - f_dash_backward_approx(1)), (h / 2) * max_double_diff(f, x(1), x(2)));
    fprintf('At x = %.1f,\nApproximate value of f'' = %.10f\nExact value of f'' = %.10f\nAbsolute error = %.10f\nError bound = %.10f\n\n', x(3),difference(1.2,1.4,1.2625,1.6595), f_der(x(3)), abs(f_der(x(3)) - f_dash_backward_approx(2)), (h / 2) * max_double_diff(f, x(2), x(3)));
    fprintf('\n');

    fprintf('Question 3\n');
    t = [1, 1.01, 1.02, 1.03, 1.04];
    i = [3.1, 3.12, 3.14, 3.18, 3.24];
    L = 0.98;
    R = 0.142;
    i_dash_forward = forward_diff(t, i);
    i_dash_backward = backward_diff(t, i);
    for cou = 1:4
        fprintf('Approximate value of the voltage at t = %.2f is: \x3B5(%.2f) = %f volt\n', t(cou),t(cou), L * i_dash_forward(cou) + R * i(cou));
    end
    fprintf('Approximate value of the voltage at t = %.2f is: \x3B5(%.2f) = %f volt\n', t(5), t(5), L * i_dash_backward(4) + R * i(5));
    fprintf('\n');
    
    fprintf('Question 4 Part a\n');
    errorplot(1,2,@f_q4a,2,@f_q4a_exact,0.25);
    orderplot(1,2,@f_q4a,2,@f_q4a_exact,100);
    h=0.25;
    t=1:h:2;
    y=euler(1,2,h,@f_q4a,2);
    ye = f_q4a_exact(t);
    yerr=abs(y-f_q4a_exact(t));
    fprintf('For h = %.2f,\n',h);
    fprintf('   t\t\tApproximate Solution\tExact Solution\t  Absolute Error\n');
    for j =1:length(t)
        fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t\t%.6f \r',t(j),y(j),ye(j),yerr(j));
    end
    fprintf('\n');

    fprintf('Question 4 Part b\n');
    errorplot(0,1,@f_q4b,1,@f_q4b_exact,0.25);
    orderplot(0,1,@f_q4b,1,@f_q4b_exact,100);
    h=0.25;
    t=0:h:1;
    y=euler(0,1,h,@f_q4b,1);
    ye = f_q4b_exact(t);
    yerr=abs(y-f_q4b_exact(t));
    fprintf('For h = %.2f,\n',h);
    fprintf('   t\t\tApproximate Solution\tExact Solution\t  Absolute Error\n');
    for j =1:length(t)
        fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t\t%.6f \r',t(j),y(j),ye(j),yerr(j));
    end
    fprintf('\n');

    fprintf('Question 4 Part c\n');
    errorplot(2,3,@f_q4c,2,@f_q4c_exact,0.25);
    orderplot(2,3,@f_q4c,2,@f_q4c_exact,100);
    h=0.25;
    t=2:h:3;
    y=euler(2,3,h,@f_q4c,2);
    ye = f_q4c_exact(t);
    yerr=abs(y-f_q4c_exact(t));
    fprintf('For h = %.2f,\n',h);
    fprintf('   t\t\tApproximate Solution\tExact Solution\t  Absolute Error\n');
    for j =1:length(t)
        fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t\t%.6f \r',t(j),y(j),ye(j),yerr(j));
    end
    fprintf('\n');

    fprintf('Question 5\n');
    fprintf('The exact value of y(5) = %.6f\n\n',f_q5_exact(5));
    h=[0.2,0.1,0.05];
    for i =1:3
        t=0:h(i):5;
        y=euler(0,5,h(i),@f_q5,1);
        ye = f_q5_exact(t);
        yerr=abs(y-f_q5_exact(t));
        fprintf('For h = %.2f,\n',h(i));
        fprintf('   t\t\tApproximate Solution\tExact Solution\t  Absolute Error\n');
        for j =1:length(t)
            fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t\t%.6f \r',t(j),y(j),ye(j),yerr(j));
        end
        fprintf('\nApproximate value of y(5) using Explicit-Euler''s method for h = %.2f is %.6f\n\n',h(i),y(end));
    end
    errorplot(0,5,@f_q5,1,@f_q5_exact,0.2);
    orderplot(0,5,@f_q5,1,@f_q5_exact,100);
    errorplot(0,5,@f_q5,1,@f_q5_exact,0.1);
    orderplot(0,5,@f_q5,1,@f_q5_exact,100);
    errorplot(0,5,@f_q5,1,@f_q5_exact,0.05);
    orderplot(0,5,@f_q5,1,@f_q5_exact,100);
end
