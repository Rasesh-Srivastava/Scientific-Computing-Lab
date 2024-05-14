function max_error = central_difference(a,b,N,alpha,f,actual_f,titl,mTa)
    h = (b-a)/N;
    Y = [alpha, actual_f(a+h)];
    errs = [0,0];
    realSol = [alpha,actual_f(a+h)];
    for i = 2:N
        Y(end+1) = Y(end-1) + 2*f(a+(i-1)*h, Y(end))*h;
    end
    
    for i = 2:N
        errs(end+1) = abs(Y(i+1) - actual_f(a+i*h));
        realSol(end+1) = actual_f(a+i*h);
    end
    max_error = max(errs);
    if mTa==1
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
        fprintf(strcat('Using Central difference method for Question ',titl,'\n'));
        fprintf('\tt\t\tApproximate Solution\tExact Solution\tAbsolute Error\n');
        for i = 1:N+1
            fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t  %.6f\n',a + (i-1)*h, Y(i), realSol(i), errs(i));
        end
    end
    
end