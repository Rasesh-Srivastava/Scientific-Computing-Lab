function q2(dg,X,y,point,part,a,b)
    syms x
    fprintf('Using Newton forward-difference formula,\n');
    fprintf('Constructing interpolating polynomial of degree %d\n',dg);
    p(x) = newton_forward_difference_q2(X,y);
    fprintf('The obtained interpolating polynomial is: p(x) = %s\n',p(x));
    warning('off','all');
    figure;
    fplot(p,[a,b],'r')
    xlabel('x')
    ylabel('p(x)')
    title(['function plot of obtained interpolating polynomial p(x) of degree ' num2str(dg)])
    hold off
    required_point = point;
    if part == 1
        fprintf('The approximate value of f(0.43) = %.10f\n', double(subs(p,x,required_point)));
    else
        fprintf('The approximate value of f(-1/3) = %.10f\n', double(subs(p,x,required_point)));
    end
    fprintf('-------------------------------------------------------------------------\n');
end