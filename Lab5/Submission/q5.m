function q5(flag)
    x0 = 0.2;
    if flag == 1
        syms x
        X = [0, 0.1, 0.3, 0.6, 1];
        y = [-6, -5.89483, -5.65014, -5.17788, -4.28172];
        l0(x) = x/x;
        l1(x) = x/x;
        l2(x) = x/x;
        l3(x) = x/x;
        l4(x) = x/x;
        L = [l0(x), l1(x), l2(x), l3(x), l4(x)];
        lagrange_interpolation(X,y,L,x0, 3);
    else
        syms x
        X = [0, 0.1, 0.3, 0.6, 1,1.1];
        y = [-6, -5.89483, -5.65014, -5.17788, -4.28172,-3.99583];
        l0(x) = x/x;
        l1(x) = x/x;
        l2(x) = x/x;
        l3(x) = x/x;
        l4(x) = x/x;
        l5(x) = x/x;
        L = [l0(x), l1(x), l2(x), l3(x), l4(x),l5(x)];
        lagrange_interpolation(X,y,L,x0, 3);
    end
end