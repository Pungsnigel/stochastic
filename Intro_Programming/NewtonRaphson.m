function [ iterates  ] = NewtonRaphson(coefficients, startPoint, tolerance )
% Will try to find a stationary point of a given polynomial.
% 
% Input  - The polynomial, a starting point and a fault-tolerance
% Return - A vector containing each 'step'. The last value will be the
%          stationary point. If, for any reason, the algorithm
%           
% Visualisation - Call PlotIterations with resulting vector and the Polynomial
%
if length(coefficients) < 2
    iterates = [];
    disp('Illigal input.')
    return
end
    

iterates = zeros(50, 1);    % Preallocate for performance
i = 1;                      % Iterator
firstDerivative = PolynomialDifferentiation(coefficients, 1);
secondDerivative = PolynomialDifferentiation(coefficients, 2);

xCurrStep = startPoint;

while true                  % Use manual break to avoid having to manually take first step 
    xFirstDerivative  = Polynomial(xCurrStep, firstDerivative);
    xSecondDerivative = Polynomial(xCurrStep, secondDerivative);
    
    if xSecondDerivative == 0
        iterates = [];
        disp('Second derivative is 0, algorithm aborted.')
        return
    end
    
    xNextStep = NewtonRaphsonStep(xCurrStep, xFirstDerivative, xSecondDerivative);
    
    iterates(i) = xCurrStep;% Store step

    if abs(xNextStep - xCurrStep) < tolerance   % Algorithm done, break and return result
        break
    end
    
    
    
    i = i + 1;              % Iterate
    xCurrStep = xNextStep;
end

iterates = iterates(1:i);   % Remove any eventual garbage left from preallocation
end

