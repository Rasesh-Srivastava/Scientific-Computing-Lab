function errorplot(a,b,f,f0,ye,h)
    t=a:h:b;
    y=euler(a,b,h,f,f0);
    yerr=abs(ye(t)-y);
    figure;
    plot(t,y,'LineWidth',1);
    hold on
    plot(t,ye(t),'LineWidth',1);
    legend({'Approximation','Actual Solution'},'Location','northwest');
    title('t vs solution');
    xlabel('t');
    ylabel('solution');
    hold off
    figure;
    plot(t,yerr,'r','LineWidth',1);
    title('t vs absolute error');
    xlabel('t');
    ylabel('absolute error');
    hold off
    figure;
    loglog(t,yerr,'r','LineWidth',1);
    title('Mesh points,i.e.,t versus absolute error (loglog plot)');
    xlabel('Mesh points,i.e.,t');
    ylabel('absolute error');
    hold off;
end