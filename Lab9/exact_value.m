function I = exact_value(f,a,b)
    I = integral(f,a,b);
    fprintf('Exact value of the integral = %.10f\n',I);
end