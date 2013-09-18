function [ xNext ] = NewtonRaphsonStep(xCurr, firstDerivative, secondDerivative )
xNext = xCurr - (firstDerivative/secondDerivative);
end

