function output_file()
    clc
    fprintf('Question 1 Part a\n');
    ImplicitEuler(1,3,10,0,@f_q1a,@f_q1a_exact,1e-6,'1 Part a',1);
    order_plot(1,3,0,@f_q1a,@f_q1a_exact,'1 Part a',1);
    RungeKuttaOrder2(1,3,10,0,@f_q1a,@f_q1a_exact,1/2,'1 Part a with c2 = 1/2 (Improved tangent Method)',1);
    order_plot(1,3,0,@f_q1a,@f_q1a_exact,'1 Part a with c2 = 1/2 (Improved tangent Method)',2);
    RungeKuttaOrder2(1,3,10,0,@f_q1a,@f_q1a_exact,2/3,'1 Part a with c2 = 2/3 (Optimal Method)',1);
    order_plot(1,3,0,@f_q1a,@f_q1a_exact,'1 Part a with c2 = 2/3 (Optimal Method)',3);
    RungeKuttaOrder2(1,3,10,0,@f_q1a,@f_q1a_exact,1,'1 Part a with c2 = 1 (Euler-Cauchy Method)',1);
    order_plot(1,3,0,@f_q1a,@f_q1a_exact,'1 Part a with c2 = 1 (Euler-Cauchy Method)',4);
    RungeKuttaOrder4(1,3,10,0,@f_q1a,@f_q1a_exact,0,'1 Part a (Classical Method)',1);
    order_plot(1,3,0,@f_q1a,@f_q1a_exact,'1 Part a (Classical Method)',5);
    RungeKuttaOrder4(1,3,10,0,@f_q1a,@f_q1a_exact,1,'1 Part a (Kutta Method)',1);
    order_plot(1,3,0,@f_q1a,@f_q1a_exact,'1 Part a (Kutta Method)',6);
    fprintf('\n');
    
    fprintf('Question 1 Part b\n');
    ImplicitEuler(0,1,10,1,@f_q1b,@f_q1b_exact,1e-6,'1 Part b',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,'1 Part b',1);
    RungeKuttaOrder2(0,1,10,1,@f_q1b, @f_q1b_exact,1/2,'1 Part b with c2 = 1/2 (Improved tangent Method)',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,'1 Part b with c2 = 1/2 (Improved tangent Method)',2);
    RungeKuttaOrder2(0,1,10,1,@f_q1b, @f_q1b_exact,2/3,'1 Part b with c2 = 2/3 (Optimal Method)',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,'1 Part b with c2 = 2/3 (Optimal Method)',3);
    RungeKuttaOrder2(0,1,10,1,@f_q1b, @f_q1b_exact,1,'1 Part b with c2 = 1 (Euler-Cauchy Method)',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,'1 Part b with c2 = 1 (Euler-Cauchy Method)',4);
    RungeKuttaOrder4(0,1,10,1,@f_q1b, @f_q1b_exact,0,'1 Part b (Classical Method)',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,'1 Part b (Classical Method)',5);
    RungeKuttaOrder4(0,1,10,1,@f_q1b,@f_q1b_exact,1,'1 Part b (Kutta Method)',1);
    order_plot(0,1,1,@f_q1b, @f_q1b_exact,'1 Part b (Kutta Method)',6);
    
    fprintf('\n');
    fprintf('Question 2\n');
    RungeKuttaOrder4(0,1,4,1,@f_q2, @f_q2_exact,0,'2 (Classical Method)',1);
    order_plot(0,1,1,@f_q2, @f_q2_exact,'2 (Classical Method)',5);
    RungeKuttaOrder4(0,1,4,1,@f_q2, @f_q2_exact,1,'2 (Kutta Method)',1);
    order_plot(0,1,1,@f_q2, @f_q2_exact,'2 (Kutta Method)',6);
end