function y=euler(a,b,h,f,f0)
    N= (b-a)/h; 
    y=1:N+1;
    y(1)=f0;
    t=a:h:b;
    for n=1:N
        y(n+1)=y(n)+h*f(t(n),y(n));
    end
end