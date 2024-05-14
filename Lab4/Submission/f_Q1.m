function y=f_Q1()
    syms x_1 x_2 x_3;
    syms f1(x_1,x_2,x_3) 
	f1(x_1,x_2,x_3) =  (x_3)^2 + 1 - x_1*x_2;
    syms f2(x_1,x_2,x_3)
	f2(x_1,x_2,x_3) =   (x_1)^2 - (x_2)^2 + 2 - x_1*x_2*x_3;
    syms f3(x_1,x_2,x_3)
	f3(x_1, x_2, x_3) =  3 - x_3 + exp(x_2) - exp(x_1);
	y = [f1(x_1, x_2, x_3), f2(x_1, x_2, x_3), f3(x_1, x_2, x_3)];
end