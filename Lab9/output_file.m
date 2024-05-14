function output_file()
    clc
    fprintf('Question 1 Part a\n');
    exact_value(@f_q1a,1,1.5);
    fprintf('With n = %d,\n',2);
    fprintf('Gaussian Quadrature:\n');
    fprintf('Using Gauss-Legendre quadrature,\n');
    gaussian_legendre_quadrature(@f_q1a,1,1.5,2);
    fprintf('Using Gauss-Lagrange (Newton-Cotes) quadrature,\n');
    gaussian_lagrange_quadrature(@f_q1a,1,1.5,2);
    fprintf('Using Gauss-Lobatto quadrature,\n');
    gaussian_lobatto_quadrature(@f_q1a,1,1.5,2);
    fprintf('\n');
    
    fprintf('Question 1 Part b\n');
    exact_value(@f_q1b,0,0.35);
    fprintf('With n = %d,\n',2);
    fprintf('Gaussian Quadrature:\n');
    fprintf('Using Gauss-Legendre quadrature,\n');
    gaussian_legendre_quadrature(@f_q1b,0,0.35,2);
    fprintf('Using Gauss-Lagrange (Newton-Cotes) quadrature,\n');
    gaussian_lagrange_quadrature(@f_q1b,0,0.35,2);
    fprintf('Using Gauss-Lobatto quadrature,\n');
    gaussian_lobatto_quadrature(@f_q1b,0,0.35,2);
    fprintf('\n');
    
    i = 2;
    while i < 6
        fprintf('Question 2 Part a\n');
        exact_value(@f_q2a,0,pi/4);
        fprintf('With n = %d,\n',i);
        fprintf('Gaussian Quadrature:\n');
        fprintf('Using Gauss-Legendre quadrature,\n');
        gaussian_legendre_quadrature(@f_q2a,0,pi/4,i);
        fprintf('Using Gauss-Lagrange (Newton-Cotes) quadrature,\n');
        gaussian_lagrange_quadrature(@f_q2a,0,pi/4,i);
        fprintf('Using Gauss-Lobatto quadrature,\n');
        gaussian_lobatto_quadrature(@f_q2a,0,pi/4,i);
        i = i + 1;
    end
    
    fprintf('\n');
    i = 2;
    while i < 6
        fprintf('Question 2 Part b\n');
        exact_value(@f_q2b,1,1.6);
        fprintf('With n = %d,\n',i);
        fprintf('Gaussian Quadrature:\n');
        fprintf('Using Gauss-Legendre quadrature,\n');
        gaussian_legendre_quadrature(@f_q2b,1,1.6,i);
        fprintf('Using Gauss-Lagrange (Newton-Cotes) quadrature,\n');
        gaussian_lagrange_quadrature(@f_q2b,1,1.6,i);
        fprintf('Using Gauss-Lobatto quadrature,\n');
        gaussian_lobatto_quadrature(@f_q2b,1,1.6,i);
        i = i + 1;
    end
    
    fprintf('\n');
    fprintf('Question 3 Part a\n');
    exact_value(@f_q3a,-1,1);
    fprintf('With n = 2,\n');
    fprintf('Gaussian Quadrature:\n');
    fprintf('Using Gauss-Legendre quadrature,\n');
    gaussian_legendre_quadrature(@f_q3a,-1,1,2);
    fprintf('Using Gauss-Lobatto quadrature,\n');
    gaussian_lobatto_quadrature(@f_q3a,-1,1,2);
    
    fprintf('Question 3 Part a\n');
    exact_value(@f_q3a,-1,1);
    fprintf('With n = 4,\n');
    fprintf('Gaussian Quadrature:\n');
    fprintf('Using Gauss-Legendre quadrature,\n');
    gaussian_legendre_quadrature(@f_q3a,-1,1,4);
    fprintf('Using Gauss-Lobatto quadrature,\n');
    gaussian_lobatto_quadrature(@f_q3a,-1,1,4);
    fprintf('\n');

    fprintf('Question 3 Part b\n');
    exact_value(@f_q3b,-1,1);
    fprintf('With n = 2,\n');
    fprintf('Gaussian Quadrature:\n');
    fprintf('Using Gauss-Legendre quadrature,\n');
    gaussian_legendre_quadrature(@f_q3b,-1,1,2);
    fprintf('Using Gauss-Lobatto quadrature,\n');
    gaussian_lobatto_quadrature(@f_q3b,-1,1,2);
    
    fprintf('Question 3 Part b\n');
    exact_value(@f_q3b,-1,1);
    fprintf('With n = 4,\n');
    fprintf('Gaussian Quadrature:\n');
    fprintf('Using Gauss-Legendre quadrature,\n');
    gaussian_legendre_quadrature(@f_q3b,-1,1,4);
    fprintf('Using Gauss-Lobatto quadrature,\n');
    gaussian_lobatto_quadrature(@f_q3b,-1,1,4);
    fprintf('\n');

    i = 2;
    while i < 7
        fprintf('Question 4 Part a\n');
        exact_value(@f_q4a,0,1);
        fprintf('With n = %d,\n',i)
        fprintf('Gaussian Quadrature:\n');
        fprintf('Using Gauss-Legendre quadrature,\n');
        gaussian_legendre_quadrature(@f_q4a,0,1,i);
        i = i + 2;
    end
    
    i = 2;
    fprintf('\n');
    while i < 7
        fprintf('Question 4 Part b\n');
        exact_value(@f_q4b,-4,4);
        fprintf('With n = %d,\n',i)
        fprintf('Gaussian Quadrature:\n');
        fprintf('Using Gauss-Legendre quadrature,\n');
        gaussian_legendre_quadrature(@f_q4b,-4,4,i);
        i = i + 2;
    end
end