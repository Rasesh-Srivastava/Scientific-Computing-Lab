function f_der = forward_diff(x, f)
    f_der = zeros(1, 2);
    for i = 1:(length(x) - 1)
        f_der(i) = (f(i + 1) - f(i)) / (x(i + 1) - x(i));
    end
end