function p = lagrange_interpolation_q3(X, y, x0,iter) 
    syms x
    
    p(x) = x-x;
    for i = 1:length(X)
        l(x) = fun(i, X);
        p(x) = p(x) + y(i)*l(x);
    end
    fprintf('The approximate value of f(1 + sqrt(10)) = %.10f. So, y_%d = %.10f\n', double(subs(p,x,x0)),iter,double(subs(p,x,x0)));
    
end