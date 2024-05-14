function plotCubicSpline(p,f,X,a,b,str,typ)
    n = length(X);
    figure;
    if n==2
        fplot(p(1),[a b],'r','LineWidth',1);
        hold on;
        fplot(f,[a b],'g','LineWidth',1);
        if typ == 1
            title(strcat('Natural Cubic Spline plot & Function plot for Question ',str))
        else
            title(strcat('Clamped Cubic Spline plot & Function plot for Question ',str))
        end
        legend('Cubic Spline plot','f(x)','Location', 'northwest');
    else
        fplot(p(1),[a,X(2)]);
        hold on;
        for i = 2:n-2
            fplot(p(i),[X(i) X(i+1)]);
            hold on;
        end
        fplot(p(n-1),[X(n-1) b]);
        hold on;
        if n-1 ~= (5-1)
            fplot(f,[a b],'r');
            title(strcat('Spline and Function plot for Question ',str));
            legend('Spline [-1,-0.5]', 'Spline [-0.5,0]', 'Spline [0,0.5]');
        else
            title(strcat('Spline plot for Question ', str));
            legend('Spline [0,3]','Spline [3,5]', 'Spline [5,8]','Spline [8,13]');
        end

    end
end