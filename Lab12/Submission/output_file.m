function output_file()
    clc
    fprintf('Question 1 Part a) using exact starting values,\n');
    adams_bashforth(1,3,10,0, @f_q1a, @f_q1a_exact, 0,' 1 Part a',1);
    order_plot(1,3,0,@f_q1a, @f_q1a_exact,' 1 Part a',1);
    adams_moulton(1,3,10,0, @f_q1a, @f_q1a_exact, 0,' 1 Part a',1);
    order_plot(1,3,0,@f_q1a, @f_q1a_exact,' 1 Part a',2);
    fprintf('Question 1 Part b) using exact starting values,\n');
    adams_bashforth(0,1,10,1, @f_q1b, @f_q1b_exact, 0,' 1 Part b',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,' 1 Part b',1);
    adams_moulton(0,1,10,1, @f_q1b, @f_q1b_exact, 0,' 1 Part b',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,' 1 Part b',2);
    fprintf('\n');

    fprintf('Question 2 \n');
    fprintf('Part a) Using Explicit Euler Method,\n');
    explicit_eulers(0,1,4,1,@f_q2, @f_q2_exact,' 2 Part a',1);
    fprintf('\n');
    fprintf('Part b) Using Implicit Euler Method,\n');
    implicit_eulers(0,1,4,1,@f_q2, @f_q2_exact,1e-5,' 2 Part b',1);
    fprintf('\n');
    fprintf('Part c),\n');
    central_difference(0,1,4,1,@f_q2, @f_q2_exact,' 2 Part c',1);
    fprintf('\n');

    %  ----------   Stability Analysis -----------
    % Please uncomment these lines to run the code for stability analysis,
    % and get the graphs pasted in the report.
    % n = [4,5,10,20,40];
    % le = length(n);
    % for i = 1:le
    %     explicit_eulers(0,1,n(i),1,@f_q2, @f_q2_exact,' 2 Part a',1);
    %     implicit_eulers(0,1,n(i),1,@f_q2, @f_q2_exact,1e-5,' 2 Part b',1);
    %     central_difference(0,1,n(i),1,@f_q2, @f_q2_exact,' 2 Part c',1);
    % end

    fprintf('Question 3\n\n');
    fprintf('Using explicit Adams-Bashforth four-step method,');
    adams_bashforth(0,1,5,0.5,@f_q3, @f_q3_exact, 0, ' 3', 1);
    order_plot(0,1,0.5,@f_q3, @f_q3_exact,' 3',1);
    fprintf('\nUsing implicit Adams-Moulton three-step method,');
    adams_moulton(0,1,5,0.5,@f_q3, @f_q3_exact, 0, ' 3', 1);
    order_plot(0,1,0.5,@f_q3, @f_q3_exact,' 3',2);

    fprintf('\n');
    fprintf('Question 4\n\n');
    fprintf('Using Adams fourth-order predictor-corrector method with starting values from the Runge-Kutta fourth order method\nto the IVP given in Question 3,');
    predictor_corrector(0,1,5,0.5,@f_q3, @f_q3_exact, 1, ' 4', 1);
    order_plot(0,1,0.5,@f_q3, @f_q3_exact, ' 4', 3);
end