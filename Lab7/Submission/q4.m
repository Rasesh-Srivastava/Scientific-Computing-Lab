function q4()
x=[-1,-0.5,0,0.5];
f=@(x) log(exp(x)+2);
y=[0.86199480, 0.95802009, 1.0986123, 1.2943767];
fp0=0.15536240;
fpn=0.45186276;
n=length(x)-1;
Const=clamped_spline_interpolation(x,y,n,fp0,fpn);
syms z;
s(z)=z-z;
figure;
plot(x,y,LineWidth=0.5,Color="red");
hold on;
fplot(@(x) f(x),[-1.2,0.6],Color="blue");
title('Question 4')
for i=1:3
    s(z)=s(z)+Const(i,1)+Const(i,2)*(z-x(i))+Const(i,3)*(z-x(i))^2+Const(i,4)*(z-x(i))^3;
    fplot(@(x) s(x),[x(i),x(i+1)],LineWidth=2);
    s(z)=0;
end
hold off;
xlabel("X");
ylabel("Y");
legend("Scatter Plot","Function Plot","Clamped Spline Plot",'Location', 'northwest');
end