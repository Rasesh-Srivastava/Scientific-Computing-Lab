function y=f_Q2b()
    syms x_1 x_2;
    syms f1(x_1,x_2) 
	f1(x_1,x_2) = 1 + (x_1)^2 - (x_2)^2 + exp(x_1)*cos(x_2);
    syms f2(x_1,x_2)
	f2(x_1,x_2) = 2*x_1*x_2 + exp(x_1)*sin(x_2);
	y = [f1(x_1, x_2), f2(x_1, x_2)];
end