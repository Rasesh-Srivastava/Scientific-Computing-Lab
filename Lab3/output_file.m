function output_file()
    fprintf('Fixed Point Iteration method for Question 1\n');
    fixedPointIteration(2,@g_Q1,1e-4,@f_Q1,1,2);
    fprintf('\n');

    fprintf('Modified Newton''s method for Question 2 part a\n');
    modifiedNewtonMethod(1.5,1e-5,@f_Q2a,@f_Q2a_prime,@f_Q2a_prime_prime,1,2);
    fprintf('\n');

    fprintf('Modified Newton''s method for Question 2 part b\n');
    modifiedNewtonMethod(-1,1e-5,@f_Q2b,@f_Q2b_prime,@f_Q2b_prime_prime,-1,0);
    fprintf('\n');

    fprintf('Muller''s method for Question 3 part a\n');
    mullers_method(@f_Q3a,1e-5,-1,5,-0.5,0,0.5);
    fprintf('\n');

    fprintf('Muller''s method for Question 3 part b\n');
    mullers_method(@f_Q3b,1e-5,-2,6,-0.5,0.1,0.5);
    fprintf('\n');

    fprintf('Fixed Point Iteration method for Question 4\n');
    fixedPointIteration(5,@g_Q4,1e-4,@f_Q4,5,6);
    fprintf('\n');
end