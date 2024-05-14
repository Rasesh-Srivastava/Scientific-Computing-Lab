function y=f_Q3()
    syms x_1 x_2 x_3;
    syms f1(x_1,x_2,x_3) 
	f1(x_1,x_2,x_3) =  6*x_1-2*cos(x_2*x_3)-1;
    syms f2(x_1,x_2,x_3)
	f2(x_1,x_2,x_3) =  9*x_2 + ((x_1)^2 + sin(x_3) + 1.06)^(0.5) + 0.9;
    syms f3(x_1,x_2,x_3)
	f3(x_1, x_2, x_3) =  60*x_3 + 3*exp(-x_1*x_2) + 10*pi -3;
	y = [f1(x_1, x_2, x_3), f2(x_1, x_2, x_3), f3(x_1, x_2, x_3)];
end