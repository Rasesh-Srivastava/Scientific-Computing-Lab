function order_plot(a, b, y0al, f, exact_f, tI, mT)
    En = [];
    E2n = [];
    N = 1:100;
    orders = [];
    if mT== 1
        for i = 1:length(N)
            En(end+1) = ImplicitEuler(a,b,N(i),y0al,f,exact_f,1e-5,tI,0);
            E2n(end+1) = ImplicitEuler(a,b,2*N(i),y0al,f,exact_f,1e-5,tI,0);
        end
    elseif mT == 2
        for i = 1:length(N)
            En(end+1) = RungeKuttaOrder2(a,b,N(i),y0al,f,exact_f,1/2,'',0);
            E2n(end+1) = RungeKuttaOrder2(a,b,2*N(i),y0al,f,exact_f,1/2,'',0);
        end
    elseif mT == 3   
        for i = 1:length(N)
            En(end+1) = RungeKuttaOrder2(a,b,N(i),y0al,f,exact_f,2/3,'',0);
            E2n(end+1) = RungeKuttaOrder2(a,b,2*N(i),y0al,f,exact_f,2/3,'',0);
        end  
    elseif mT == 4   
        for i = 1:length(N)
            En(end+1) = RungeKuttaOrder2(a,b,N(i),y0al,f,exact_f,1,'',0);
            E2n(end+1) = RungeKuttaOrder2(a,b,2*N(i),y0al,f,exact_f,1,'',0);
        end
    elseif mT == 5   
        for i = 1:length(N)
            En(end+1) = RungeKuttaOrder4(a,b,N(i),y0al,f,exact_f,0,'',0);
            E2n(end+1) = RungeKuttaOrder4(a,b,2*N(i),y0al,f,exact_f,0,'',0);
        end
    else 
        for i = 1:length(N)
            En(end+1) = RungeKuttaOrder4(a,b,N(i),y0al,f,exact_f,1,'',0);
            E2n(end+1) = RungeKuttaOrder4(a,b,2*N(i),y0al,f,exact_f,1,'',0);
        end
    end
    for i = 1:length(En)
        orders(end+1) = log2(En(i)/E2n(i));
    end
    figure;
    plot(N, orders,'r','LineWidth',1);
    title(strcat('N vs Order of Convergence for Q',tI));
    xlabel('N')
    ylabel('Order of Convergence');
    hold off;
    figure;
    plot(log(N), log(En),'r','LineWidth',1);
    title(strcat('Plot of log(E_N) vs log(N) for Q',tI));
    xlabel('log(N)')
    ylabel('log(E_N)');
    hold off;
end