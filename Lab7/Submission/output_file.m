function output_file()
    clc
    syms x
    fprintf('Question 1\n');
    fprintf('Using Hermite Interpolation, Lagrange basis method to approximate f(0.25)\n\n');
    [yq1, Hq1, ~] = hermite([-1,-0.5,0,0.5],[0.86199480,0.95802009,1.0986123,1.2943767],[0.15536240,0.23269654,0.33333333,0.45186776],0.25);
    fprintf('Exact value of f(0.25) = %.12f\n',log(exp(0.25) + 2));
    fprintf('Absolute error = %d\n', abs(log(exp(0.25) + 2)) - yq1);
    f = @(x) log(exp(x)+2);
    figure;
    fplot(f,'r','LineWidth',1);
    hold on
    fplot(Hq1,'g','LineWidth',1);
    legend('f(x)','H(x)');
    hold off
    fprintf('\n');
    fprintf('Using Hermite Interpolation, Newton''s Divided Differences method to approximate f(0.25)\n\n');
    [yq1, ~, ~] = hermite_interpolation([-1,-0.5,0,0.5],[0.86199480,0.95802009,1.0986123,1.2943767],[0.15536240,0.23269654,0.33333333,0.45186776],0.25,1);
    fprintf('Exact value of f(0.25) = %.12f\n',log(exp(0.25) + 2));
    fprintf('Absolute error = %d\n\n', abs(log(exp(0.25) + 2)) - yq1);
    fprintf('\n');

    fprintf('Question 2 part a\n');
    fprintf('Using Hermite Interpolation, Newton''s Divided Differences method to approximate f(10)\n\n');
    [yq2, Hq2, H1q2] = hermite_interpolation([0,3,5,8,13], [0,225,383,623,993], [75,77,80,74,72], 10,2);
    fprintf('So, The approximate position of the car at t = 10 seconds is %.12f feet\n',yq2);
    fprintf('Approximate speed of the car at t = 10 seconds is %.12f feet per second\n',double(subs(H1q2,x,10)));
    fprintf('\n');
    fprintf('Question 2 part b and part c\n');
    fprintf('55 mi/h = 80.6667 feet/sec\n')
    question2(Hq2,H1q2);
    fprintf('\n');


    fprintf('Question 3 part a\n')
    fprintf('Exact value of f(0.43) = %.10f\n',double(exp(2*0.43)));
    fprintf('Exact value of f''(0.43) = %.10f\n',double(2*exp(2*0.43)));
    f = exp(2*x);
    fprintf('\nUsing Natural Cubic Spline Interpolation\n\n');
    [f_3, f1_3] = NaturalCubicSpline([0,0.5], [1,exp(1)], 1);
    fprintf('Approximate Value of f(%.2f) = %.12f\n', 0.43, double(subs(f_3,x,0.43)));
    fprintf('Approximate Value of f''(%.2f) = %.12f\n\n', 0.43, double(subs(f1_3,x,0.43)));
    plotCubicSpline(f_3,f,[0,0.5],-1.5,1.5,' 3 part a',1);
    fprintf('The error in f(x) at x = 0.43 is %.10f\n', abs(double(subs(f_3,x,0.43)) - double(exp(2*0.43))));
    fprintf('The error in f''(x) at x = 0.43 is %.10f\n', abs(double(subs(f1_3,x,0.43)) - double(2*exp(2*0.43))));

    fprintf('\nUsing Clamped Cubic Spline Interpolation\n\n');
    [f_3, f1_3] = ClampedCubicSpline([0,0.5], [1,exp(1)], 1, 2, 2*exp(1));
    fprintf('Approximate Value of f(%.2f) = %.12f\n', 0.43, double(subs(f_3,x,0.43)));
    fprintf('Approximate Value of f''(%.2f) = %.12f\n\n', 0.43, double(subs(f1_3,x,0.43)));
    plotCubicSpline(f_3,f,[0,0.5],-1.5,1.5,' 3 part a',2);
    fprintf('The error in f(x) at x = 0.43 is %.10f\n', abs(double(subs(f_3,x,0.43)) - double(exp(2*0.43))));
    fprintf('The error in f(x) at x = 0.43 is %.10f\n', abs(double(subs(f1_3,x,0.43)) - double(2*exp(2*0.43))));
    fprintf('\n')


    fprintf('Question 3 part b\n')
    fprintf('Exact value of f(0.25) = %.10f\n', double(log(exp(0.25)+2)));
    fprintf('Exact value of f1(0.25) = %.10f\n\n', double(exp(0.25)/(exp(0.25) + 2)));
    f = log(exp(x)+2);
    fprintf('\nUsing Natural Cubic Spline Interpolation\n\n');
    [f_3, f1_3] = NaturalCubicSpline([0,0.5], [log(3),log(exp(0.5) + 2)], 1);
    fprintf('Approximate Value of f(%.2f) is: %.12f\n', 0.25, double(subs(f_3,x,0.25)));
    fprintf('Approximate Value of f1(%.2f) is: %.12f\n\n', 0.25, double(subs(f1_3,x,0.25)));
    plotCubicSpline(f_3,f,[0,0.5],-2.5,2.5,' 3 part b',1);
    fprintf('The error in f(x) at x = 0.25 is %.10f\n', abs(double(subs(f_3,x,0.25)) - double(log(exp(0.25)+2))));
    fprintf('The error in f(x) at x = 0.25 is %.10f\n', abs(double(subs(f1_3,x,0.25)) - double(exp(0.25)/(exp(0.25) + 2))));

    fprintf('\nUsing Clamped Cubic Spline Interpolation\n\n');
    [f_3, f1_3] = ClampedCubicSpline([0,0.5], [log(3),log(exp(0.5) + 2)], 1, double(exp(0)/(exp(0) + 2)), double(exp(0.5)/(exp(0.5) + 2)));
    fprintf('Approximate Value of f(%.2f) is: %.12f\n', 0.25, double(subs(f_3,x,0.25)));
    fprintf('Approximate Value of f1(%.2f) is: %.12f\n\n', 0.25, double(subs(f1_3,x,0.25)));
    plotCubicSpline(f_3,f,[0,0.5],-2.5,2.5,' 3 part b',2);
    fprintf('The error in f(x) at x = 0.25 is: %.10f\n', abs(double(subs(f_3,x,0.25)) - double(log(exp(0.25)+2))));
    fprintf('The error in f(x) at x = 0.25 is: %.10f\n', abs(double(subs(f1_3,x,0.25)) - double(exp(0.25)/(exp(0.25) + 2))));
    fprintf('\n')
    fprintf('Question 4\n');
    q4();
    fprintf('\n');
    fprintf('Question 5\n')
    q5();
    fprintf('\n');
end