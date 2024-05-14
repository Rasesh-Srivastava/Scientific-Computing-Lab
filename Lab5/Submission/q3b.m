function q3b()
    syms x;
    X = [0.6, 0.7, 0.8, 1];
    y = [-0.17694460, 0.01375227, 0.22363362, 0.65809197];
    l0(x) = x/x; l1(x) = x/x; l2(x) = x/x; l3(x) = x/x;
    L = [l0(x), l1(x), l2(x), l3(x)];
    x0 = 0.9;
    lagrange_interpolation(X,y,L,x0, 4);
end