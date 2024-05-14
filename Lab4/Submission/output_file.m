function output_file()
    fprintf('Newton''s method for Question 1\n');
	newton_method_3variables(1e-6, 1, 1, 1, f_Q1,1);
    fprintf('\n');
    fprintf('Newton''s method for Question 2 part a\n');
	newton_method_2variables(2, 0, 1, f_Q2a);
    fprintf('\n');
    fprintf('Newton''s method for Question 2 part b\n');
	newton_method_2variables(5, -1, 4, f_Q2b);
    fprintf('\n');
    fprintf('Newton''s method for Question 3\n');
	newton_method_3variables(1e-6, 0, 0, 0, f_Q3,3);
    fprintf('\n');
    plotting_3d_graphs_Q2();
end