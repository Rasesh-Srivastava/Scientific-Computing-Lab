function q5()
time=[0,3,5,8,13];
distance=[0,225,383,623,993];
n=length(time)-1;
Const=cubic_spline_interpolation(time,distance,n);
syms z;
s(z)=Const(4,1)+Const(4,2)*(z-time(4))+Const(4,3)*(z-time(4))^2+Const(4,4)*(z-time(4))^3;
EstimatedDistance=s(10);
EstimatedSpeed=(s(10+1e-5)-s(10))/(1e-5);
fprintf("\nEstimated distance travelled at t = %.0f seconds using natural cubic spline interpolation = %.12f feet\n",10,EstimatedDistance);
fprintf("Estimated speed using natural cubic spline interpolation at t = %.0f seconds = %.12f feet/sec\n",10,EstimatedSpeed);
figure;
scatter(time,distance,'o','MarkerEdgeColor','magenta');
hold on;
fplot(@(x) s(x),[8,13],LineWidth=1.5);
hold off;
xlabel("Time");
ylabel("Distance");
title('Question 5 Natural')
legend("Scatter Plot","Natural Cubic Spline Plot",'Location', 'northwest');
coeff2=clamped_spline_interpolation(time,distance,n,75,72);
syms z;
s2(z)=coeff2(4,1)+coeff2(4,2)*(z-time(4))+coeff2(4,3)*(z-time(4))^2+coeff2(4,4)*(z-time(4))^3;
dist_est2=s2(10);
speed_est2=(s2(10+1e-5)-s2(10))/(1e-5);

fprintf("\nEstimated distance travelled at t = %.0f seconds using Clamped cubic Spline interpolation is %.12f feet\n",10,dist_est2);
fprintf("Estimated speed using Clamped cubic Spline interpolation at t = %.0f seconds = %.12f feet/sec\n",10,speed_est2);
figure;
scatter(time,distance,'o','MarkerEdgeColor','magenta');
hold on;
fplot(@(x) s2(x),[8,13],LineWidth=2);
hold off;
xlabel("Time");
ylabel("Distance");
title('Question 5 Clamped')
legend("Scatter Plot","Clamped Cubic Spline Plot",'Location', 'northwest');
end