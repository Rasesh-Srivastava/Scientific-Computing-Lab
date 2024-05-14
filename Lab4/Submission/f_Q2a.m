function y=f_Q2a()
    syms x_1 x_2;
    syms f1(x_1,x_2) 
	f1(x_1,x_2) = 4*(x_1)^2 - (x_2)^2;
    syms f2(x_1,x_2)
	f2(x_1,x_2) = 4*x_1*(x_2)^2 - x_1 -1;
	y = [f1(x_1, x_2), f2(x_1, x_2)];
end