function val = max_double_diff(f, a, b)
    val = realmin;
    x = linspace(a, b);
    myDiff = diff(f, 2);
    for i = x
        val = max(val, abs(myDiff(i)));
    end
end