function newton_divided_method(flag,X)
    if flag == 1
        x = [0,0.1,0.3,0.6,1];
        y = [-6,-5.89483,-5.65014,-5.17788,-4.28172];
    elseif flag == 2
        x = [0,0.1,0.3,0.6,1,1.1];
        y = [-6,-5.89483,-5.65014,-5.17788,-4.28172,-3.99583];
    else
        x = [1950, 1960, 1970, 1980, 1990, 2000];
        y = [151326, 179323, 203302, 226542, 249633, 281422];
    end
    n = size(x,2);
    DividedDiff = zeros(n,n);
    DividedDiff(:,1) = y';
    for j=2:n
        for i=1:(n-j+1)
            num=DividedDiff(i+1,j-1)-DividedDiff(i,j-1);
            den=(x(i+j-1)-x(i));
            DividedDiff(i,j) = num./den;
        end
    end
    for i= 1:size(x,2)-1
        P(i) = prod(X-x(:,1:i))*DividedDiff(1,i+1);
    end
    Y=y(1)+sum(P);
    fprintf('Newton''s divided difference table is:\n');
    T=array2table(DividedDiff)
    if flag < 3
        fprintf('Approximate value of f(%.1f) = %.12f \n',X,Y);
    else 
        fprintf('Approximate population in the year %.0f = %.0f \n',X,Y);
    end
end