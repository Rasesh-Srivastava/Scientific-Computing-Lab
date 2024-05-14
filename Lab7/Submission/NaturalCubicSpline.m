function [f,f1] = NaturalCubicSpline(X,fx,n)
    a = fx;
    h = zeros(n);
    for i = 1:n
        h(i) = X(i+1) - X(i);
    end
    for i = 2:n
        paraAl(i) = (3/h(i))*(a(i+1) - a(i)) - (3/h(i-1))*(a(i) - a(i-1));
    end
    l(1) = 1;
    mu(1) = 0;
    z(1) = 0;
    for i = 2:n
        l(i) = 2*(X(i+1) - X(i-1))- h(i-1)*mu(i-1);
        mu(i) = h(i)/l(i);
        z(i) = (paraAl(i) - h(i-1)*(z(i-1)))/l(i);
    end
    l(n+1) = 1;
    z(n+1) = 0;
    c(n+1) = 0;
    for j = n:-1:1
        c(j) = z(j)- mu(j)*c(j+1);
        b(j) = (a(j+1)- a(j))/h(j) - h(j)*(c(j+1) + 2*c(j))/3;
        d(j) = (c(j+1) - c(j))/(3*h(j));
    end
    syms x;
    f = sym('f',[1,n]);
    f1 = sym('f', [1,n]);
    for i = 1:n
        f(i) = a(i) + (b(i)*(x-X(i))) + (c(i)*(x-X(i))^2) + (d(i)*(x-X(i))^3);
        f1(i) = diff(f(i),x);
    end
end