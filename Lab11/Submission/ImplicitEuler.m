function maximumError = ImplicitEuler(a,b,N,y0al,f,exact_f,tol,titl,flagVar)
    maxiters = 200;
    h = (b-a)/N;
    Y = [y0al];
    errs = [0];
    realSol = [y0al];
    for i = 1:N
        Y(end+1) = Y(end);
        for j = 1:maxiters
            next = Y(end-1) + h*f(a+i*h, Y(end));
            if abs(next-Y(end)) < tol
                Y(end) = next;
                break;
            end
            Y(end) = next;
        end
    end
    for i = 1:N
        errs(end+1) = abs(Y(i+1) - exact_f(a+i*h));
        realSol(end+1) = exact_f(a+i*h);
    end
    maximumError = max(errs);
    if flagVar == 1
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
        fprintf(strcat('Using Implicit-Euler method for Q',titl,'\n'));
        fprintf('\tt\t\tApproximate Solution\tExact Solution\tAbsolute Error\n');
        for i = 1:N+1
            fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t  %.6f\n',a + (i-1)*h, Y(i), realSol(i), errs(i));
        end
        fprintf('\n');
    end
end