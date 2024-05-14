function u = f_q4b_exact(x,t)
    u = (exp((-pi*pi*t)/4))*sin((pi*x)/2) + 0.5*exp(-4*pi*pi*t)*sin(2*pi*x);
end