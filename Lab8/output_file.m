function output_file()
    clc
    fprintf('Question 1\n');
    fprintf('\nPart (a)\n');
    rectangle_rule(@f_q1a,0.5,1);
    fprintf('\nPart (b)\n');
    rectangle_rule(@f_q1b,0,0.5);
    fprintf('\nPart (c)\n');
    rectangle_rule(@f_q1c,1,1.6);
    fprintf('\nPart (d)\n');
    rectangle_rule(@f_q1d,0,double(pi/4));
    fprintf('\nPart (e)\n');
    rectangle_rule(@f_q1e,0.75,1.3);
    fprintf('\n');

    fprintf('Question 2\n');
    fprintf('\nPart (a)\n');
    midpoint_rule(@f_q1a,0.5,1);
    fprintf('\nPart (b)\n');
    midpoint_rule(@f_q1b,0,0.5);
    fprintf('\nPart (c)\n');
    midpoint_rule(@f_q1c,1,1.6);
    fprintf('\nPart (d)\n');
    midpoint_rule(@f_q1d,0,double(pi/4));
    fprintf('\nPart (e)\n');
    midpoint_rule(@f_q1e,0.75,1.3);
    fprintf('\n');

    fprintf('Question 2\n');
    fprintf('\nPart (a)\n');
    trapezoidal_rule(@f_q1a,0.5,1);
    fprintf('\nPart (b)\n');
    trapezoidal_rule(@f_q1b,0,0.5);
    fprintf('\nPart (c)\n');
    trapezoidal_rule(@f_q1c,1,1.6);
    fprintf('\nPart (d)\n');
    trapezoidal_rule(@f_q1d,0,double(pi/4));
    fprintf('\nPart (e)\n');
    trapezoidal_rule(@f_q1e,0.75,1.3);
    fprintf('\n');

    fprintf('Question 2\n');
    fprintf('\nPart (a)\n');
    simpson_oneThird_rule(@f_q1a,0.5,1);
    fprintf('\nPart (b)\n');
    simpson_oneThird_rule(@f_q1b,0,0.5);
    fprintf('\nPart (c)\n');
    simpson_oneThird_rule(@f_q1c,1,1.6);
    fprintf('\nPart (d)\n');
    simpson_oneThird_rule(@f_q1d,0,double(pi/4));
    fprintf('\nPart (e)\n');
    simpson_oneThird_rule(@f_q1e,0.75,1.3);
    fprintf('\n');

    fprintf('Question 3\n');
    fprintf('Exact value of pi = %.10f\n\n', pi);
    rectangle_rule(@f_q3,0,1);
    fprintf('\n');
    trapezoidal_rule(@f_q3,0,1);
    fprintf('\n');
    simpson_oneThird_rule(@f_q3,0,1);
    fprintf('\n');
    simpson_threeEighth_rule(@f_q3,0,1);
    fprintf('\n');

    fprintf('Question 4\n');
    x = [1,5/4,3/2,7/4,2];
    y = [10,8,7,6,5];
    composite_trapezoidal_rule(x,y,4);
    fprintf('\n')

    fprintf('Question 5');
    fprintf('\nPart (a) Composite Trapezoidal Rule\n');
    q5(@f_q5,1,2,1);
    fprintf('\nPart (b) Composite Simpson''s Rule\n')
    q5(@f_q5,1,2,2);
    fprintf('\nPart (c) Composite Midpoint Rule\n')
    q5(@f_q5,1,2,3);
    fprintf('\n');

    fprintf('Question 6\n');
    x = [0,6,12,18,24,30,36,42,48,54,60,66,72,78,84];
    y = [124,134,148,156,147,133,121,109,99,85,78,89,104,116,123];
    composite_trapezoidal_rule(x,y,6);
    composite_simpson_rule(x,y,6);
    fprintf('\n');
end