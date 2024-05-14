function root = bisection_method(a,b,tol,f)
    maxIterations = 1000;
    N = [];
    Xn = [];
    if abs(f(a)) <= tol
        root = a;
        N(end+1) = 0;
        Xn(end+1) = a;
        disp(['Root found after ', num2str(0), ' iterations.']);
        disp(['Root is: ', num2str(root)]);
        fprintf('Staring point, a, is a root\n')
        fprintf('No. of iterations\t\tApproximate solution\t\tError |X_n - X_n-1|\n');
        fprintf('\t%d\t\t\t\t\t%.15f\t\t\t--\n',0,Xn(1));
        figure;
        plot(N,Xn,'.','MarkerSize',10)
        xlabel('n')
        ylabel('X_n')
        hold off
        return;
    end
    if abs(f(b)) <= tol
        root = b;
        N(end+1) = 0;
        Xn(end+1)=b;
        disp(['Root found after ', num2str(0), ' iterations.']);
        disp(['Root is: ', num2str(root)]);
        fprintf('Staring point, b, is a root\n')
        fprintf('No. of iterations\t\tApproximate solution\t\tError |X_n - X_n-1|\n');
        fprintf('\t%d\t\t\t\t\t%.15f\t\t\t--\n',0,Xn(0));
        figure;
        plot(N,Xn,'.','MarkerSize',10)
        xlabel('n')
        ylabel('X_n')
        hold off
        return;
    end
    
    if f(a) * f(b) > 0
        error('The function must have different signs at the endpoints of the interval.');
        root = NaN;
        return;
    end
    for k = 1:maxIterations
        N(end+1) = k;
        c = a + ((b - a) / 2);
        Xn(end+1) = c;
        if abs(f(c)) < tol
            root = c;
            disp(['Root found after ', num2str(k), ' iterations.']);
            disp(['Root is: ', num2str(root)]);
            figure;
            plot(N,Xn,'r')
            xlabel('n')
            ylabel('X_n')
            hold off
            resi = [];
            i=1;
            while i <= k-1
                resi(end+1) = abs(Xn(i+1) - Xn(i));
                i = i + 1;
            end
            fprintf('No. of iterations\t\tApproximate solution\t\tError |X_n - X_n-1|\n');
            fprintf('\t%d\t\t\t\t\t%.15f\t\t\t--\n',1,Xn(1));
            N_new=[];
            s=2;
            while s <= k
                N_new(end+1) = s;
                fprintf('\t%d\t\t\t\t\t%.15f\t\t\t%.15f\n',s,Xn(s), resi(s-1));
                s =s+1;
            end
            figure;
            plot(N_new,resi,'r')
            xlabel('n')
            ylabel('Residue |X_n - X_n_-_1|')
            hold off
            return;
        end
        if f(c) * f(a) < 0
            b = c;
        else
            a = c;
        end
    end
    fprintf('Bisection method did not converge to the desired tolerance.');
    root = NaN;
    return;

end
