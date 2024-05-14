function myAnswer = cubic_spline_interpolation(x,a,n)
    h=zeros(1,n);
    for i=1:n
        h(i)=x(i+1)-x(i);
    end
    xa = zeros(1,n);
    for i = 1:n-1
        xa(i+1) = 3.0*(a(i+2)*h(i)-a(i+1)*(x(i+2)-x(i))+a(i)*h(i+1))/(h(i+1)*h(i));
    end
    xl = zeros(1,n+1);
    xu = zeros(1,n+1);
    xz = zeros(1,n+1);
    xl(1) = 1;
    xu(1) = 0;
    xz(1) = 0;

    for i = 1:n-1
        xl(i+1) = 2*(x(i+2)-x(i))-h(i)*xu(i);
        xu(i+1) = h(i+1)/xl(i+1);
        xz(i+1) = (xa(i+1)-h(i)*xz(i))/xl(i+1);
    end
    xl(n+1) = 1;
    xz(n+1) = 0;
    b = zeros(1,n+1);
    c = zeros(1,n+1);
    d = zeros(1,n+1);
    c(n+1) = xz(n+1);
    
    for i = 0:n-1
        j = n-1-i;
        c(j+1) = xz(j+1)-xu(j+1)*c(j+2);
        b(j+1) = (a(j+2)-a(j+1))/h(j+1) - h(j+1) * (c(j+2) + 2.0 * c(j+1)) / 3.0;
        d(j+1) = (c(j+2) - c(j+1)) / (3.0 * h(j+1));
    end
     fprintf('The coefficients of the spline on the subintervals are:\n');
     fprintf('     a(i)        b(i)          c(i)          d(i)\n');
     for i = 0:n-1
       fprintf('%11.8f  %11.8f  %11.8f  %11.8f \n',a(i+1),b(i+1),c(i+1),d(i+1));
     end
    myAnswer=[];
    for i=1:n
        myAnswer=vertcat(myAnswer,[a(i),b(i),c(i),d(i)]);
    end
end