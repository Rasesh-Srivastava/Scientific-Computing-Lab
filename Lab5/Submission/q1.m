function q1()
syms x
X = [0.0, 0.2, 0.4, 0.6, 0.8];
y = [1.00000, 1.22140, 1.49182, 1.82212, 2.22554];
fprintf('Using Newton forward-difference formula\n');
p(x) = newton_forward_difference(X,y);
required_point = 0.05;
fprintf('The approximate value of f(0.05) = %.10f\n\n', double(subs(p,x,required_point)));
fprintf('Using Newton backward-difference formula\n');
p(x) = newton_backward_difference(X,y);
required_point = 0.65;
fprintf('The approximate value of f(0.65) = %.10f\n', double(subs(p,x,required_point)));
end
