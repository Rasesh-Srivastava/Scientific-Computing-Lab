function q3()
    h=0;
    x=[];
    y=[];
    p=1+sqrt(10);
    f=@(x) 1./(1+x.^2);
    figure
    fplot(f,[-5,5],'r');
    xlabel('x');
    ylabel('f(x)');
    title('Function Plot of f(x)');
    hold off
    fullY = [];
    nArray = [1,2,3,4,5,6,7,8,9,10];
    fprintf('Taking P_n as Newton forward-difference interpolating polynomial,\n');
    for n = 1:10
        h1=10/n;
        x= 0:n;
        x= (h1*x)-5;
        y=1./(1+x.^2);
        fprintf('For n = %d, ',n)
        temp = forward_diff_q3(x,y,p,n);
        fullY(end+1) = temp;
    end
    fprintf('\nTaking P_n as Newton backward-difference interpolating polynomial,\n')
    for n = 1:10
        h1=10/n;
        x= 0:n;
        x= (h1*x)-5;
        y=1./(1+x.^2);
        fprintf('For n = %d, ',n)
        backward_diff_q3(x,y,p,n);
    end
    fprintf('\nTaking P_n as Lagrange Interpolant,\n')
    for n = 1:10
        h1=10/n;
        x= 0:n;
        x= (h1*x)-5;
        y=1./(1+x.^2);
        fprintf('For n = %d, ',n)
        lagrange_interpolation_q3(x,y,p,n);
    end
    figure
    plot(nArray,fullY,'-or');
    xlabel('n');
    ylabel('y_n');
    title('Plot of the sequence \{y_n\}');
    hold off
end