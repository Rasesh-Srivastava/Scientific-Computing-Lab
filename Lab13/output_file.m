function output_file()
    clc
    N1 = 1:1:125;
    N2 = 2*N1;
    fprintf('Question 1\n');
    fprintf('Using Linear Shooting Method with h = %c/4,\n',960);
    que1(0, pi/2, ' 1 Part a', N1, N2, [2, 0], @(x) 1, @(x) 2, @(x) cos(x), @(x) (-1/10)*(sin(x) + 3*cos(x)), -0.3, -0.1);
    fprintf('Using Linear Shooting Method with h = %c/8,\n',960');
    que1(0, pi/2, ' 1', N1, N2, [4, 0], @(x) 1, @(x) 2, @(x) cos(x), @(x) (-1/10)*(sin(x) + 3*cos(x)), -0.3, -0.1);
    fprintf('\n');

    fprintf('Question 2 Part a\n');
    fprintf('Using forward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_1(1,2,' 2 Part a',N1,N2,[19,0],@(x) -4/x,@(x) -2/(x^2), @(x) (2*log(x))/(x^2),@f_q2a_exact,1/2,log(2),1);
    fprintf('\n');

    fprintf('Using backward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_1(1,2,' 2 Part a',N1,N2,[19,0],@(x) -4/x,@(x) -2/(x^2), @(x) (2*log(x))/(x^2),@f_q2a_exact,1/2,log(2),3);
    fprintf('\n');

    fprintf('Using central difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_1(1,2,' 2 Part a',N1,N2,[19,0],@(x) -4/x,@(x) -2/(x^2), @(x) (2*log(x))/(x^2),@f_q2a_exact,1/2,log(2),2);
    fprintf('\n');
    
    fprintf('Question 2 Part b\n');
    fprintf('Using forward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_1(0,2,' 2 Part b',N1,N2,[19,0],@(x) 2,@(x) -1, @(x) x*exp(x) - x,@f_q2b_exact,0,-4,1);
    fprintf('\n');

    fprintf('Using backward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_1(0,2,' 2 Part b',N1,N2,[19,0],@(x) 2,@(x) -1, @(x) x*exp(x) - x,@f_q2b_exact,0,-4,3);
    fprintf('\n');

    fprintf('Using central difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_1(0,2,' 2 Part b',N1,N2,[19,0],@(x) 2,@(x) -1, @(x) x*exp(x) - x,@f_q2b_exact,0,-4,2);
    fprintf('\n');
    
    fprintf('Question 2 Part c\n');
    fprintf('Using forward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_2(0,pi/2,' 2 Part c',N1,N2,[19,0],@(x) 1,@(x) 2, @(x) cos(x),@f_q2c_exact,-1/10,3/10,1);
    fprintf('\n');

    fprintf('Using backward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_2(0,pi/2,' 2 Part c',N1,N2,[19,0],@(x) 1,@(x) 2, @(x) cos(x),@f_q2c_exact,-1/10,3/10,3);
    fprintf('\n');

    fprintf('Using central difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_2(0,pi/2,' 2 Part c',N1,N2,[19,0],@(x) 1,@(x) 2, @(x) cos(x),@f_q2c_exact,-1/10,3/10,2);
    fprintf('\n');

    fprintf('Question 2 Part d\n');
    fprintf('Using forward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_2(-1,0,' 2 Part c',N1,N2,[19,0],@(x) -x,@(x) 2, @(x) 2+(exp(x)*(2+(x^2))),@f_q2d_exact,-2,1,1);
    fprintf('\n');

    fprintf('Using backward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_2(-1,0,' 2 Part c',N1,N2,[19,0],@(x) -x,@(x) 2, @(x) 2+(exp(x)*(2+(x^2))),@f_q2d_exact,-2,1,3);
    fprintf('\n');

    fprintf('Using central difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_2(-1,0,' 2 Part c',N1,N2,[19,0],@(x) -x,@(x) 2, @(x) 2+(exp(x)*(2+(x^2))),@f_q2d_exact,-2,1,2);
    fprintf('\n');

    fprintf('Question 2 Part e\n');
    fprintf('Using forward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_3(0,1,' 2 Part e',N1,N2,[19,0],@(x) -2,@(x) -1, @(x) x,@f_q2e_exact,exp(1)-3,1-2/exp(1),1);
    fprintf('\n');

    fprintf('Using backward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_3(0,1,' 2 Part e',N1,N2,[19,0],@(x) -2,@(x) -1, @(x) x,@f_q2e_exact,exp(1)-3,1-2/exp(1),3);
    fprintf('\n');

    fprintf('Using central difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_3(0,1,' 2 Part e',N1,N2,[19,0],@(x) -2,@(x) -1, @(x) x,@f_q2e_exact,exp(1)-3,1-2/exp(1),2);
    fprintf('\n');

    fprintf('Question 2 Part f\n');
    fprintf('Using forward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_3(0,pi/4,' 2 Part f',N1,N2,[19,0],@(x) -cos(x),@(x) -1, @(x) (sqrt(2) - 1)*cos(x)*cos(x) - (sin(2*x))/2,@f_q2f_exact,sqrt(2),2-sqrt(2),1);
    fprintf('\n');

    fprintf('Using backward difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_3(0,pi/4,' 2 Part f',N1,N2,[19,0],@(x) -cos(x),@(x) -1, @(x) (sqrt(2) - 1)*cos(x)*cos(x) - (sin(2*x))/2,@f_q2f_exact,sqrt(2),2-sqrt(2),3);
    fprintf('\n');

    fprintf('Using central difference for the first-order derivative and central difference for the second-order derivative,\n');
    que2_3(0,pi/4,' 2 Part f',N1,N2,[19,0],@(x) -cos(x),@(x) -1, @(x) (sqrt(2) - 1)*cos(x)*cos(x) - (sin(2*x))/2,@f_q2f_exact,sqrt(2),2-sqrt(2),2);
    fprintf('\n');
end