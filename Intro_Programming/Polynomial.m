function [ sum ] = Polynomial(x, coefficients )
% Given a value of x and a polynomial, will calculate the sum.
%
% Input    -    The value of x, the coefficients of the polynomial.
% Returns  -    The sum of the polynomial at point x.
%

sum = 0;

for i=0:length(coefficients) - 1
    sum = sum + coefficients(i + 1) * x^i;
end
end


