function trapezoidal_rule(f,a,b)
    I = integral(f,a,b);
    fprintf('Exact value of integral = %.10f\n',I);
    App = double(((f(a)+f(b))*(b-a))/2);
    fprintf('Using Trapezoidal Rule, Approximate value of integral = %.10f\n',App);
    fprintf('Absolute Error = %.10f\n', abs(I - App));
end