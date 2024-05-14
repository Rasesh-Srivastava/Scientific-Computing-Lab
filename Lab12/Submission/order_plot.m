function order_plot(a, b, alpha, f, actual_f, tI, method_type)
    N = 1:300;
    En = [];
    E2n = [];
    if method_type== 1
        for i = 1:length(N)
            En(end+1) = adams_bashforth(a,b,N(i),alpha,f,actual_f,0,tI,0);
            E2n(end+1) = adams_bashforth(a,b,2*N(i),alpha,f,actual_f,0,tI,0);
        end
    elseif method_type== 2
        for i = 1:length(N)
            En(end+1) = adams_moulton(a,b,N(i),alpha,f,actual_f,0,tI,0);
            E2n(end+1) = adams_moulton(a,b,2*N(i),alpha,f,actual_f,0,tI,0);
        end
    elseif method_type== 3
        for i = 1:length(N)
            En(end+1) = predictor_corrector(a,b,N(i),alpha,f,actual_f,0,tI,0);
            E2n(end+1) = predictor_corrector(a,b,2*N(i),alpha,f,actual_f,0,tI,0);
        end
    end
    orders = [];
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