function max_error = adams_bashforth(a,b,N,alpha,f,actual_f,runge_or_actual,titl,display_plot_and_tables)
    Y = [];
    errs = [];
    realSol = [];
    h = (b-a)/N;
    if runge_or_actual == 0
        for i = 1:4
            Y(end+1) = actual_f(a+(i-1)*h);
        end
    elseif runge_or_actual == 1
        [max_error, Y] = fourth_order_runge_kutta(a,b,N,alpha,f,actual_f,1,titl,0);
    end
    for i = 5:N+1
        Y(i) = Y(i-1) + (h/24)*( 55*f(a+(i-2)*h, Y(i-1)) - 59*f(a+(i-3)*h, Y(i-2))  + 37*f(a+(i-4)*h, Y(i-3)) - 9*f(a+(i-5)*h, Y(i-4)));
    end
    for i = 1:length(Y)
        errs(end+1) = abs(Y(i) - actual_f(a+(i-1)*h));
        realSol(end+1) = actual_f(a+(i-1)*h);
    end
    max_error = max(errs);
    if display_plot_and_tables==1
        t = a:h:b;
        figure;
        plot(t,realSol,t,Y,'LineWidth',1);
        title(strcat('t versus solution plot for Q',titl));
        xlabel('t')
        ylabel('solution');
        legend('Actual Solution','Approximate Solution','Location','northwest')
        hold off;
        figure;
        plot(t, errs,'r','LineWidth',1);
        title(strcat('t vs absolute error plot for Q',titl));
        xlabel('t')
        ylabel('absolute error');
        hold off;
        figure;
        loglog(t,errs,'r','LineWidth',1);
        title('Mesh points,i.e.,t versus absolute error (loglog plot)');
        xlabel('Mesh points,i.e.,t');
        ylabel('absolute error');
        hold off;
        fprintf(strcat('\nUsing Adams-Bashforth method for Question ',titl,',\n'));
        fprintf('\tt\t\tApproximate Solution\tExact Solution\tAbsolute Error\n');
        for i = 1:N+1
            fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t  %.6f\n',a + (i-1)*h, Y(i), realSol(i), errs(i));
        end
    end
    
end