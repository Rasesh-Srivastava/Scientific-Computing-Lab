function App = composite_trapezoidal_rule(x,y,qnum)
    lx = length(x);
    ly = length(y);
    h = double((x(end)-x(1))/(lx-1));
    i = 2;
    sum = 0;
    while i < ly
        sum = sum + y(i);
        i = i+1;
    end
    App = h*sum + double((h/2) * (y(1)+y(end)));
    if qnum == 6
        fprintf('Using Composite Trapezoidal Rule, Approximate length of the track = %.2f feet\n',App);
    elseif qnum == 4
        fprintf('Using Composite Trapezoidal Rule, Approximate value of integral = %.10f\n',App);
    end
end