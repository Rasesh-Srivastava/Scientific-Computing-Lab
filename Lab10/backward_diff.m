function f_der = backward_diff(x, f)
    f_der = zeros(1, 2);
    for i = 2:(length(x))
        f_der(i - 1) = (f(i) - f(i - 1)) / (x(i) - x(i - 1));
    end
end