function answ = forward_diff_q3(x,f,target_x,iter)
    h = x(2) - x(1);
    n = length(f);
    diff_table = zeros(n, n);
    diff_table(:,1) = f';
    for j = 2:n
        for i = 1:n-j+1
            diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
        end
    end
    s = (target_x - x(1)) / h;
    x_plot= linspace(-10,10,100);
    m = (x_plot-x(1))/h;
    approx_value = f(1);
    funcc=ones(1,100)*f(1);
    multiplier = 1;
    multiplier1= ones(1,100);
    for i = 1:n-1
        multiplier = multiplier * (s - (i-1)) / i;
        multiplier1 = multiplier1.* ((m - (i-1)) / i);
        approx_value = approx_value + diff_table(1, i+1) * multiplier;
        funcc = funcc + multiplier1*diff_table(1, i+1);
    end
    % plot(x_plot,funcc,'g');
    fprintf('The approximate value of f(1 + sqrt(10)) = %.10f. So, y_%d = %.10f\n',approx_value,iter, approx_value);
    answ = approx_value;
end