function [ dCoefficients ] = PolynomialDifferentiation( coefficients, k)
% Returns the k'th derivative of a given polynomial. Will only work for
% first or second derivatives.
%
% Input     -    The Polynomial, the number of times to derive.
% Return    -    The resulting polynomial.
%

lengthOfInput = length(coefficients);

for i=1:k                   % Derivive k times
    for j=k:lengthOfInput   % Derive
       coefficients(j) = coefficients(j) * (j-1);
    end    
end

dCoefficients = coefficients(1+k:lengthOfInput);
end
