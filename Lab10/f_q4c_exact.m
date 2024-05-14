function y = f_q4c_exact(t)
    c=sqrt(2)*exp(1);
    y = exp(-t).*((c+(exp(t/2).*(t-2))).^2);
end