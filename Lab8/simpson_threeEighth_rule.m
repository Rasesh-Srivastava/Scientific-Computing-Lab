function simpson_threeEighth_rule(f,a,b)
    I = integral(f,a,b);
    fprintf('Exact value of integral = %.10f\n',I);
    h = double((b-a)/3);
    term = double((3*h)/8);
    x0 = a;
    x1 = a + h;
    x2 = a + 2*h;
    x3 = b;
    App = double((b-a)/8) * (f(x0) + 3*f(x1) + 3*f(x2) + f(x3));
    fprintf('Using Simpson''s three-eighth Rule, Approximate value of integral = %.10f\n',App);
    fprintf('Absolute Error = %.10f\n', abs(I - App));
end