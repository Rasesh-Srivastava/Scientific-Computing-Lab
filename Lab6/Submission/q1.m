function q1()
    syms x
    X = [1,1.5,2,2.5];
    y = [2.7183,4.4817,7.3819,12.1825];
    fprintf('Using Newton forward-difference interpolation,\n');
    p(x) = newton_forward_difference(X,y);
    required_point = 2.25;
    fprintf('The approximate value of f(2.25) = %.10f\n', double(subs(p,x,required_point)));
    fprintf('-------------------------------------------------------------------------\n');
    fprintf('Using Newton backward-difference interpolation,\n');
    p(x) = newton_backward_difference(X,y);
    required_point = 2.25;
    fprintf('The approximate value of f(2.25) = %.10f\n', double(subs(p,x,required_point)));
    fprintf('-------------------------------------------------------------------------');
end