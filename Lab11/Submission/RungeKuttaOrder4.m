function maximumError = RungeKuttaOrder4(a,b,N,y0al,f,exact_f,typ,titl,flagVar)
    h = (b-a)/N;
    Y = [y0al];
    errs = [0];
    realSol = [y0al];
    if typ == 0
        c2 = 1/2;
        c3 = 1/2;
        c4 = 1;
        a21 = 1/2;
        a31 = 0;
        a32 = 1/2;
        a41 = 0;
        a42 = 0;
        a43 = 1;
        w1 = 1/6;
        w2 = 2/6;
        w3 = 2/6;
        w4 = 1/6;
    else
        c2 = 1/3;
        c3 = 2/3;
        c4 = 1;
        a21 = 1/3;
        a31 = -1/3;
        a32 = 1;
        a41 = 1;
        a42 = -1;
        a43 = 1;
        w1 = 1/8;
        w2 = 3/8;
        w3 = 3/8;
        w4 = 1/8;
    end
    for i = 1:N
        K1 = h* f(a+(i-1)*h, Y(end));
        K2 = h* f(a+(i-1)*h + c2*h, Y(end) + a21*K1);
        K3 = h* f(a+(i-1)*h + c3*h, Y(end) + a31*K1 + a32*K2);
        K4 = h* f(a+(i-1)*h + c4*h, Y(end) + a41*K1 + a42*K2 + a43*K3);
        Y(end+1) = Y(end) + w1*K1 + w2*K2 + w3*K3 + w4*K4;
    end
    for i = 1:N
        errs(end+1) = abs(Y(i+1) - exact_f(a+i*h));
        realSol(end+1) = exact_f(a+i*h);
    end
    maximumError = max(errs);
    if flagVar==1
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
        fprintf(strcat('Using Fourth-order Runge-Kutta Method for Q',titl,'\n'));
        fprintf('\tt\t\tApproximate Solution\tExact Solution\tAbsolute Error\n');
        for i = 1:N+1
            fprintf('%.6f\t\t%.6f\t\t\t  %.6f\t\t  %.6f\n',a + (i-1)*h, Y(i), realSol(i), errs(i));
        end
        fprintf('\n');
    end
end