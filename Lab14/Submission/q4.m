function q4()             
ic = @(x) 2*sin(2*pi.*x);     
bc_1 = @(t) 0;                                  
bc_2 = @(t) 0;                                  
a_x = 0;                                        
b_x = 1;
a_t = 0;                                       
b_t = 1;
h = 0.04;
k = h^2/4;                                 
c = 1/16;
exact_sol = @(x,t) 2*exp(-(pi*pi*t)/4).*sin(2*pi*x);
[num_sol x t] = ftcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
plot_N_Max_error('ftcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

[num_sol x t] = btcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
plot_N_Max_error('btcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

[num_sol x t] = Crank_Nicolson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
plot_N_Max_error('cncn',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

ic = @(x) sin(pi.*x/2) + 0.5*sin(2*pi*x);      
bc_1 = @(t) 0;                                  
bc_2 = @(t) exp(-(pi*pi*t/4));                                  
a_x = 0;                                        
b_x = 1;
a_t = 0;                                       
b_t = 1;
h = 0.04;
k = h^2/4;                                 
c = 1;
exact_sol = @(x,t) exp(-(pi*pi*t/4)).*sin(pi*x/2) + 0.5*exp(-(pi*pi*t*4)).*sin(pi*x*2) ;
[num_sol x t] = ftcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
plot_N_Max_error('ftcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

[num_sol x t] = btcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
plot_N_Max_error('btcs',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

[num_sol x t] = Crank_Nicolson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
plot_end_time(exact_sol,num_sol,x,t);
surface_plot(exact_sol,num_sol,x,t);
plot_N_Max_error('cncn',c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol);

function plot_end_time(exact_sol,num_sol,x,t)
figure;
[n m] = size(num_sol);
plot(x,num_sol(n,:),'r+','LineWidth',2);
hold on;
plot(x,exact_sol(x,t(n)),'g','LineWidth',1);
hold off;
legend('Numerical Solution','Exact Solution');
title('Plot of exact and Numerical Solution at Final time');
end

function surface_plot(exact_sol,num_sol,x,t)
    figure;
    subplot(1,2,1);
    mesh(x,t,num_sol);
    subplot(1,2,2);
    [X Y] = meshgrid(x,t);
    surf(X,Y,exact_sol(X,Y));
    colormap('hot');
    title('Surface plot of Numerical Solution and Exact solution');
end

function plot_N_Max_error(scheme,c,a_x,b_x,a_t,b_t,ic,bc_1,bc_2,exact_sol) 
    i = 1;
    N = 1;
    for N = 10:20:90
        h = (b_x - a_x)/(N-1);
        k = h^2/8;
        if scheme=='ftcs'
            [U x t] = ftcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
        elseif scheme=='btcs'
            [U x t] = btcs(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
        else 
            [U x t] = Crank_Nicolson(c,a_x,b_x,a_t,b_t,h,k,ic,bc_1,bc_2);
        end
        error = abs(exact_sol(x',t) - U');
        Max_error(i) = max(max(error));
        i = i+1;
        
    end
    figure;
    plot(log([10:20:90]),log(Max_error),'r');
    xlabel('log(N)');
    ylabel('log(Max. Error)');
    title('N vs Max. Error (loglog plot)');
    hold off
end
end