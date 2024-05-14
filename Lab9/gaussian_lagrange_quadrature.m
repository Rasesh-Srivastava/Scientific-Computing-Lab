function App = gaussian_lagrange_quadrature(f,a,b,n)
    I = integral(f,a,b);
    h=(b-a)/(n-1);
    if n==2
        App=(h/2)*(f(a)+f(b));
    elseif n==3
        App=(h/3)*(f(a)+4*(f((a+b)/2))+f(b));
    elseif n==4
        App=(3*h/8)*(f(a)+3*f((2*a+b)/3)+3*f((a+2*b)/3)+f(b));
    elseif n==5
        App=(2*h/45)*(7*f(a)+32*f((a+h))+12*f(a+2*h)+32*f(a+3*h)+7*(f(a+4*h)));
    end
    fprintf('Approximate Value of the integral = %.10f\n',App);
    fprintf('Absolute Error = %.10f\n\n',abs(App-I));
end