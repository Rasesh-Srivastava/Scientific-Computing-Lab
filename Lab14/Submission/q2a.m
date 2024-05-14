function q2a(N, var)
    maxerror = zeros(1, length(N));
    z = 1;
    for n = N
        m = n;
        a1 = 0; b1 = 0.5;
        a2 = 0; b2 = 0.5;
        f11 = @(x) 0; f12 = @(x) 200*x;
        f21 = @(y) 0; f22 = @(y) 200*y;
        h = (b1 - a1)/n;
        A = zeros(n+1,m+1);
        Err = zeros(n+1,m+1);
        for i = 1:n+1
            A(i, 1) = f21(b2 - (i-1)*h);
            A(i, n+1) = f22(b2 - (i-1)*h);
            A(1, i) = f12(a1 + (i-1)*h);
            A(n+1, i) = f11(a1 + (i-1)*h);
        end
        max_itr = 1000;
        for k = 1:max_itr
            for i = 2:n
                for j = 2:n
                    A(i, j) = 0.25*(A(i-1, j) + A(i+1, j) + A(i, j-1) + A(i, j+1));
                end
            end
        end
        for i = 2:n
            for j = 2:n
                x = a1 + (j-1)*h;
                y = b2 - (i-1)*h;
                Err(i, j) = abs(A(i, j) - 400*x*y);
            end
        end
        if var == n
            x = a1 : h : b1;
            y = b2 : -h : a2;
            disp(A);
            [X,Y] = meshgrid(x,y);
            figure
            mesh(X,Y,A,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            colormap("hot")
            hold on;
            contour(X,Y,A,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
            title('Surface Plot and Contour Plot of Numerical Solution');
            hold off;
            figure
            mesh(X,Y,Err,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            colormap("hot")
            title('Surface Plot of absolute error');
            hold off;
            x = a1 : 0.005 : b1;
            y = b2 : -0.005 : a2;
            [X,Y] = meshgrid(x,y);
            M = 400*X.*Y;
            figure
            mesh(X,Y,M,'FaceColor','interp', 'FaceAlpha',0.6, 'EdgeColor','black');
            colormap("hot")
            hold on;
            contour(X,Y,M,'FaceColor','auto', 'FaceAlpha',0.6, 'EdgeColor','black');
            title('Surface Plot and Contour Plot of Exact Solution');
            hold off;
        end
        maxerror(z) = max(max(Err));
        z = z+1;
    end
    delx = (b1 - a1)./N;
    figure
    loglog(delx, maxerror,'r','LineWidth', 2);
    title('loglog plot');
    hold off;
end