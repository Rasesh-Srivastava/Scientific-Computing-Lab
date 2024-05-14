function [max_error,Y] = fourth_order_runge_kutta(a,b,N,alpha,f,actual_f,classical_or_kutta,~,~)
    h = (b-a)/N;
    Y = [alpha];
    errors = [0];
    actual = [alpha];
    if classical_or_kutta == 0
        c2 = 1/2; c3 = 1/2; c4 = 1;
        a21 = 1/2;
        a31 = 0; a32 = 1/2;
        a41 = 0; a42 = 0; a43 = 1;
        w1 = 1/6; w2 = 2/6; w3 = 2/6; w4 = 1/6;
    else
        c2 = 1/3; c3 = 2/3; c4 = 1;
        a21 = 1/3;
        a31 = -1/3; a32 = 1;
        a41 = 1; a42 = -1; a43 = 1;
        
        w1 = 1/8; w2 = 3/8; w3 = 3/8; w4 = 1/8;
    end
    for i = 1:N
        K1 = h* f(a+(i-1)*h, Y(end));
        K2 = h* f(a+(i-1)*h + c2*h, Y(end) + a21*K1);
        K3 = h* f(a+(i-1)*h + c3*h, Y(end) + a31*K1 + a32*K2);
        K4 = h* f(a+(i-1)*h + c4*h, Y(end) + a41*K1 + a42*K2 + a43*K3);
        Y(end+1) = Y(end) + w1*K1 + w2*K2 + w3*K3 + w4*K4;
    end
    for i = 1:N
        errors(end+1) = abs(Y(i+1) - actual_f(a+i*h));
        actual(end+1) = actual_f(a+i*h);
    end    
    max_error = max(errors);
end