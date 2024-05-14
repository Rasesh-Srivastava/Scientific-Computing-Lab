function [lagrangeInterpolant, lagrangeInterpolantDer] = UsingLagrangeBasis(i,X)
    syms x;
    lagrangeInterpolant(x) = x/x;
    n = length(X);
    for j = 1:n
        if j ~= i
            lagrangeInterpolant = lagrangeInterpolant * (x-X(j))/double((X(i) - X(j)));
        end
    end
    lagrangeInterpolantDer = diff(lagrangeInterpolant,x,1);
end