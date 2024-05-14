function output_file()
    clc
    fprintf('Question 1\n');
    q1();
    fprintf('\n');

    fprintf('Question 2\n');
    fprintf('Using Lagrange interpolation method\n');
    q2();
    fprintf('\n');
    
    fprintf('Question 3 part a\n');
    fprintf('Using Lagrange interpolation method\n');
    q3a();
    fprintf('\n');

    fprintf('Question 3 part b\n');
    fprintf('Using Lagrange interpolation method\n');
    q3b();
    fprintf('\n');
   
    fprintf('Question 4\n');
    fprintf('Newton''s divided difference interpolation method for Question 4\n');
    newton_divided_method(3,1940);
    newton_divided_method(3,1975);
    newton_divided_method(3,2020);
    fprintf('\n');

    fprintf('Question 5\n');
    fprintf('Lagrange''s interpolation method for Question 5\n');
    q5(1);
    fprintf('\n');
    fprintf('Newton''s divided difference interpolation method for Question 5\n');
	newton_divided_method(1,0.2);
    fprintf('\n');
    fprintf('After adding f(1.1) = -3.99583\n');
    fprintf('Lagrange''s interpolation method for Question 5\n');
    q5(2);
    fprintf('\n');
    fprintf('Newton''s divided difference interpolation method for Question 5\n');
	newton_divided_method(2,0.2);
    fprintf('\n');
end