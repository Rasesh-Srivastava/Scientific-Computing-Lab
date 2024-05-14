function p = lagrange_interpolation(X, y, L, x0, flag) 
    syms x
    for i = 1:length(L)
        L(i) = term_calc(i, X);
    end 
    p(x) = x-x;
    for i = 1:length(y)
        p(x) = p(x) + y(i)*L(i);
    end
    if flag ~= 2
        fprintf('Approximate value of f(%.2f) = %.12f\n',x0, double(subs(p,x,x0)));
    end
end