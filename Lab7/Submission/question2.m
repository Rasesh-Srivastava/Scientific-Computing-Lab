function question2(herm,hermDer)
    syms x;
    figure;
    fplot(herm,[0 15],'cyan');
    hold on;
    title('Function plot for Question 2');
    xlabel('Time');
    ylabel('Position');
    legend('H(x)', 'Location', 'northwest');
    hold off;
    figure;
    fplot(hermDer,[0 13],'r');
    hold on;
    fplot(80.667 + x - x,[0 13],'g');
    title('Speed Plot - 55 miles per hour line');
    xlabel('Time');
    ylabel('Speed');
    legend('Speed polynomial','55mi/h = 80.667 feet/sec');
    hold off;
    for i = 5:0.001:6
        if double(subs(hermDer,x,i))>=80.667
            fprintf('Yes, the car exceeds the 55 mi/h speed limit on the road\n')
            fprintf('The car crosses 55 mi/h for the first time at %.2f second\n',i);
            break;
        end
    end
    MaximumValue = 1;
    for i = 11:0.001:13
        if double(subs(hermDer,x,i))>= MaximumValue
            MaximumValue = double(subs(hermDer,x,i));
        end
    end
    fprintf('The predicted maximum speed for the car = %.10f feet per second\n',MaximumValue);
end