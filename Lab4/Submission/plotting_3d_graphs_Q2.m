function plotting_3d_graphs_Q2()
    [X,Y] = meshgrid(linspace(-5,5,100), linspace(-5,5,100));

    figure;
    subplot(2, 1, 1);
    F_1 = 4*(X).^2 - (Y).^2;
    F_2 = 4*X.*(Y).^2 - X -1;
    mesh(X,Y,F_1)
    hold on
    mesh(X,Y,F_2)
    title('Question 2 part a');
    hold off

    figure;
    subplot(2, 1, 1);
    F_3 = 1 + (X).^2 - (Y).^2 + exp(X).*cos(Y);
    F_4 = 2*X.*Y + exp(X).*sin(Y);
    mesh(X,Y,F_3)
    hold on
    mesh(X,Y,F_4)
    title('Question 2 part b');
    hold off
end