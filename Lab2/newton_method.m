function root = newton_method(x0,f,f_prime,tolerance)
    maxIterations=1000;
    v=f(x0);
    N = [];
    Xn = [];
    N(end+1) = 0;
    Xn(end+1) = x0;
    if abs(v)<=tolerance
        root=x0;
        disp(['No iterations were required, the root is :', num2str(root)]);
        fprintf('No. of iterations\t\tApproximate solution\t\tError |X_n - X_n-1|\n');
        fprintf('\t%d\t\t\t\t\t%.15f\t\t\t--\n',0,Xn(1));
        figure;
        plot(N,Xn,'.','MarkerSize',10)
        xlabel('n')
        ylabel('X_n')
        hold off
        return;
    end
    for k = 1:maxIterations
        N(end+1) = k;
        x1=x0-v/f_prime(x0);
        Xn(end+1) = x1;
        v=f(x1);
        if abs(v)<tolerance
            root=x1;
            disp(['Root found after ', num2str(k), ' iterations.']);
            disp(['Root is: ', num2str(x1)]);
            figure;
            plot(N,Xn,'r')
            xlabel('n')
            ylabel('X_n')
            hold off
            resi = [];
            i=1;
            while i <= k
                resi(end+1) = abs(Xn(i+1) - Xn(i));
                i = i +1;
            end
            fprintf('No. of iterations\t\tApproximate solution\t\tError |X_n - X_n-1|\n');
            fprintf('\t%d\t\t\t\t\t%.15f\t\t\t--\n',0,Xn(1));
            N_new=[];
            s=1;
            while s <= k
                N_new(end+1) = s;
                fprintf('\t%d\t\t\t\t\t%.15f\t\t\t%.15f\n',s,Xn(s+1), resi(s));
                s =s+1;
            end
            figure;
            if length(N_new) > 1
                plot(N_new,resi,'r')
            else
                plot(N_new,resi,'.','MarkerSize',10)
            end
            xlabel('n')
            ylabel('Residue |X_n - X_n_-_1|')
            hold off
            return;
        end
        x0=x1;
    end
    disp('The function could not converge within the required tolerance in the given number of maximum iterations')
end
