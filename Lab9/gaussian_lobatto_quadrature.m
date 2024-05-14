function App = gaussian_lobatto_quadrature(f,a,b,n)
    coeff=[];
    xis=[];
    I = integral(f,a,b);
    if n==2
        coeff=[1,1];
        xis=[-1,1];
    elseif n==3
        coeff=[1/3,4/3,1/3];
        xis=[-1,0,1];
    elseif n==4
        coeff=[1/6,5/6,5/6,1/6];
        xis=[-1,-1/sqrt(5),1/sqrt(5),1];
    elseif n==5
        coeff=[1/10,49/90,32/45,49/90,1/10];
        xis=[-1,-sqrt(3)/sqrt(7),0,sqrt(3)/sqrt(7),1];
    end
    App=0;
    for i = 1:n
        App=App+(coeff(i)*f(((b-a)*xis(i)+a+b)/2))*(b-a)/2;
    end
    fprintf('Approximate Value of the integral = %.10f\n',App);
    fprintf('Absolute Error = %.10f\n\n',abs(App-I));
end