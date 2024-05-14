function output_file()
    clc
    fprintf('Question 1\n');
    fprintf('f(x) = exp(x)\n\n');
    q1();
    a = exp(2.25);
    fprintf('\nExact value of f(2.25) = %.10f\n',a);
    fprintf('\n');

    fprintf('Question 2 part a\n\n');
    q2(1,[0,0.25],[1,1.64872],0.43,1,-0.25,1);
    q2(2,[0,0.25,0.5],[1,1.64872,2.71828],0.43,1,-0.25,1);
    q2(3,[0,0.25,0.5,0.75],[1,1.64872,2.71828,4.48169],0.43,1,-0.25,1);
    fprintf('\n');

    fprintf('Question 2 part b\n\n');
    a = double(-1/3);
    q2(1,[-0.75,-0.5],[-0.07181250,-0.02475000],a,2,-1,0.25);
    q2(2,[-0.75,-0.5,-0.25],[-0.07181250,-0.02475000, 0.33493750],a,2,-1,0.25);
    q2(3,[-0.75,-0.5,-0.25,0],[-0.07181250,-0.02475000, 0.33493750,1.10100000],a,2,-1,0.25);
    fprintf('\n');

    fprintf('Question 3\n\n');
    q3()
    a = double(1/(1+((1+sqrt(10))*(1+sqrt(10)))));
    fprintf('\nExact value of f(1 + sqrt(10)) = %.10f', a);
    fprintf('\n');
end