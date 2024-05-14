function simpson_oneThird_rule(f,a,b)
    I = integral(f,a,b);
    fprintf('Exact value of integral = %.10f\n',I);
    App = double((b-a)/6) * (f(a) + 4*f(double((a+b)/2)) + f(b));
    fprintf('Using Simpson''s one-third Rule, Approximate value of integral = %.10f\n',App);
    fprintf('Absolute Error = %.10f\n', abs(I - App));
end