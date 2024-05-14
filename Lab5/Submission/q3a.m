function q3a()
    syms x
    X = [0, 0.25, 0.5, 0.75];
    y = [1, 1.64872, 2.71828, 4.48169];
    l0(x) = x/x; l1(x) = x/x; l2(x) = x/x; l3(x) = x/x;
    L = [l0(x), l1(x), l2(x), l3(x)];
    x0 = 0.43;
    lagrange_interpolation(X,y,L,x0, 4);
end