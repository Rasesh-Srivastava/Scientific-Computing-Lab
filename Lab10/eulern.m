function y=eulern(a,b,N,f,f0)
    h= (b-a)/N; 
    y=1:N+1;
    y(1)=f0;
    t=linspace(a,b,N+1);
    for n=1:N
        y(n+1)=y(n)+h*f(t(n),y(n));
    end
end