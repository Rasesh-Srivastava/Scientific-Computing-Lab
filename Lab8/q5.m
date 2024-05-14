function q5(f,a,b,part)
    I = integral(f,a,b);
    fprintf('Exact value of integral = %.10f\n',I);
    n = 1;
    while true
        x = [];
        y = [];
        i = 0;
        h = double((b-a)/n);
        while i <= n
            x(end+1) = a + i*h;
            y(end+1) = f(a+i*h);
            i = i + 1;
        end
        App = 0;
        if part == 1
            App = composite_trapezoidal_rule(x,y,5);
        elseif part == 2
            App = composite_simpson_rule(x,y,5);
        elseif part == 3
            App = composite_midpoint_rule(x,y,5);
        end
        if abs(I - App) <= 1e-5
            if part == 2 || part == 3
                n = n/2;
            end
            h = (b-a) / n;
            fprintf('For the error to be within 10^(-5), ')
            fprintf('n = %d, h = %.8f\n\n',n,h);
            fprintf('For n = %d and h = %.8f, Approximate Value of the Integral = %.10f\n',n,h,App)
            fprintf('Absolute Error = %.10f\n',abs(I-App));
            break;
        end
        n = n+1;
    end
end