function midpoint_rule(f,a,b)
    I = integral(f,a,b);
    fprintf('Exact value of integral = %.10f\n',I);
    App = (f(double((a+b)/2))*(b-a));
    fprintf('Using Midpoint Rule, Approximate value of integral = %.10f\n',App);
    fprintf('Absolute Error = %.10f\n', abs(I - App));
end