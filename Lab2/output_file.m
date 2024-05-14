function output_file()
    fprintf('Bisection Method for Q1\n');
    bisection_method(0,1,1e-8,@f_Q1);
    fprintf('\n')

    fprintf('Bisection Method for Q2 part a\n');
    bisection_method(0.5,1.5,1e-5,@f_Q2a);
    fprintf('\n')

    fprintf('Bisection Method for Q2 part b\n');
    bisection_method(0,4,1e-5,@f_Q2b);
    fprintf('\n')

    fprintf('Bisection Method for Q2 part c\n');
    bisection_method(3,4,1e-5,@f_Q2c);
    fprintf('\n')

    fprintf('Newton Method for Q3 part a\n');
    newton_method(1.75,@f_Q3a,@f_Q3a_prime,1e-5);
    fprintf('\n')

    fprintf('Newton Method for Q3 part b\n');
    newton_method(1,@f_Q3b,@f_Q3b_prime,1e-5);
    fprintf('\n')

    fprintf('Newton Method for Q3 part c\n');
    newton_method(0.5,@f_Q3c,@f_Q3c_prime,1e-5);
    fprintf('\n')

    fprintf('Newton Method for Q3 part d\n');
    newton_method(6.5,@f_Q3d,@f_Q3d_prime,1e-5);
    fprintf('\n')

    fprintf('Newton Method for Q4\n');
    newton_method(0.0001,@f_Q4,@f_Q4_prime,1e-5);
    fprintf('\n')

    fprintf('Newton Method for Q5 for the root between -1 and 0\n');
    newton_method(-0.5,@f_Q5,@f_Q5_prime,1e-6);
    fprintf('\n')

    fprintf('Newton Method for Q5 for the root between 0 and 1\n');
    newton_method(0.5,@f_Q5,@f_Q5_prime,1e-6);
    fprintf('\n')

    fprintf('Bisection Method for Q5 for the root between -1 and 0\n');
    bisection_method(-1,0,1e-6,@f_Q5);
    fprintf('\n')

    fprintf('Bisection Method for Q5 for the root between 0 and 1\n');
    bisection_method(0,1,1e-6,@f_Q5);
    fprintf('\n')

    fprintf('Newton Method for Q6\n');
    newton_method(5,@f_Q6,@f_Q6_prime,1e-6);
    fprintf('\n')
    
    fprintf('Newton Method for Q7\n');
    newton_method(2,@f_Q7,@f_Q7_prime,1e-6);
    fprintf('\n')
end