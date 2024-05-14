function q2()
    f = @(x) sin(log(x));
    X = [2.0, 2.4, 2.6];
    y = f(X);
    syms x
    l0(x) = x/x; l1(x) = x/x; l2(x) = x/x;
    L = [l0(x), l1(x), l2(x)];
    p(x) = lagrange_interpolation(X, y, L, 2.2, 2);
    xInterval = [2, 2.6];
    dx = 0.001;
    X = xInterval(1): dx : xInterval(2);
    h = [];
    for i = 1:length(X)
        h = [h, abs(double(subs(p, x, X(i))) - f(X(i)))];
    end

    fprintf('Required bound for the absolute error = %.8f\n',max(h));
    fprintf('that is, maximum possible error = %.8f on the interval [x0, x2]\n',max(h));
    figure
    fplot(@(x) f(x),[1,3.5],'g','LineWidth',1);
    hold on;
    fplot(@(x) p(x),[1,3.5],'r','LineWidth',1);
    xline(2);
    xline(2.6);
    yline(f(2));
    yline(f(2.6));
    legend('f(x)', 'p(x)');
    legend('Location','northwest');
    t = strcat('Function Plot of Question 2');
    title(t)
    figure
    fplot(@(x) abs(p(x) - f(x)),[2,2.6],'r','LineWidth',1);
    t = 'Absolute Error plot for Question 2';
    title(t)
end