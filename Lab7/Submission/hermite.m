function [y, herm, hermDer] = hermite(X,fx,fx1,input)
    syms x;
    n = length(X);
    herm(x) = x-x;
    for i = 1:n
        [li,li1] = UsingLagrangeBasis(i,X);
        hi(x) = (1-(2 * double(subs(li1,x,X(i))) * (x-X(i)))) * li(x) * li(x);
        hi1(x) = (x-X(i)) * li(x) * li(x);
        herm(x)  = herm(x) + fx(i)*hi(x) + fx1(i)*hi1(x);
    end
    herm;
    hermDer(x) = diff(herm,x,1);
    y = double(subs(herm,x,input));
    fprintf('The approximate value of f(%.2f) = %.12f\n', input, y);
end