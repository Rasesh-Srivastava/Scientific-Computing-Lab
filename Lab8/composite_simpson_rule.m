function App = composite_simpson_rule(x,y,qnum)
    lx = length(x);
    ly = length(y);
    N = (lx-1)/2;
    h = double((x(end)-x(1))/N);
    i = 1;
    sum = 0;
    while i < N
        sum = sum + y(2*i+1);
        i = i+1;
    end
    i = 1;
    sum2 = 0;
    while i < N+1
        sum2 = sum2 + y(2*i);
        i=i+1;
    end
    App = double((h/6)* (y(1) + y(end)+ 2*sum + 4*sum2));
    if qnum == 6
    fprintf('Using Composite Simpson''s Rule, Approximate length of the track = %.2f feet\n',App);
    end
end