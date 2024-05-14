function backward_diff_q3(x,f,target_x,iter)
    h = x(2) - x(1);
    n = length(f);
    diff_table = zeros(n, n);
    diff_table(:,1) = f';

    for j = 2:n
        for i = j:n
            diff_table(i,j) = diff_table(i,j-1) - diff_table(i-1,j-1);
        end
    end
    s = (target_x - x(n)) / h;

    approx_value = f(n);
    multiplier = 1;
    for i = 1:n-1
        multiplier = multiplier * (s + (i-1)) / i;
        approx_value = approx_value + diff_table(n, i+1) * multiplier;
    end

    fprintf('The approximate value of f(1 + sqrt(10)) = %.10f. So, y_%d = %.10f\n',approx_value,iter, approx_value);
end