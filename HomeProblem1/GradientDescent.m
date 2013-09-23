function [  ] = GradientDescent( startingPoint, penalty, n, T)

iterate = startingPoint;

while (true)
    gradient = Gradient(iterate,penalty);
    lengthOfGradient = sqrt(gradient(1)^2 + gradient(2)^2);
    iterate = iterate - gradient * n;
    if (lengthOfGradient < T)
        break;
    end
end

fprintf('Found minimum with penalty %i at %.3f,%.3f \n',penalty, iterate(1), iterate(2));
end

