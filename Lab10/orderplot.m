function orderplot(a,b,f,f0,ye,nmax)
    order=ones(1,nmax);
    for N=1:nmax
        t=linspace(a,b,N+1);
        y=eulern(a,b,N,f,f0);
        yerr=abs(ye(t)-y);
        en=abs(max(yerr));
        t=linspace(a,b,2*N+1);
        y=eulern(a,b,2*N,f,f0);
        yerr=abs(ye(t)-y);
        e2n=abs(max(yerr));
        order(N)=log2(en/e2n);
    end 
    figure;
    plot(1:nmax,order,'r','LineWidth',1);
    title('N vs order of convergence');
    xlabel('N');
    ylabel('order of convergence');
    hold off
end