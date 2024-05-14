function [f,f1] = ClampedCubicSpline(X, fx, n, var1, var12)
    a = fx;
    for i = 1:n
        h(i) = X(i+1) - X(i);
    end
    paraAl(1) = 3*(a(2) - a(1))/h(1) - 3*var1;
    paraAl(n+1) = 3*var12 - 3*(a(n+1) - a(n))/h(n);
    for i = 2:n
        paraAl(i) = 3/h(i) * (a(i+1) - a(i)) - 3/h(i-1)*(a(i) - a(i-1));
    end
    l(1) = 2*h(1);
    mu(1) = 0.5;
    z(1) = paraAl(1)/l(1);
    for i = 2:n
        l(i) = 2*(X(i+1)-X(i-1))- h(i-1)*mu(i-1);
        mu(i) = h(i)/l(i);
        z(i) = (paraAl(i) - h(i-1)*z(i-1))/l(i);
    end
    l(n+1) = h(n)*(2-mu(n));
    z(n+1) = (paraAl(n+1) - h(n)*z(n))/l(n+1);
    c(n+1) = z(n+1);
    for j = n:-1:1
        c(j) = z(j) - mu(j)*c(j+1);
        b(j) = (a(j+1) - a(j))/h(j)- h(j)*(c(j+1) + 2*c(j))/3;
        d(j) = (c(j+1)- c(j))/(3*h(j));
    end
    syms x;
    f = sym('f',[1,n]);
    f1 = sym('f', [1,n]);
    for i = 1:n
        f(i) = a(i) + (b(i)*(x-X(i))) + (c(i)*(x-X(i))^2) + (d(i)*(x-X(i))^3);
        f1(i) = diff(f(i),x);
    end
end