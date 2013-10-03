function [ gradient ] = Gradient( point, penalty )
x1 = point(1);
x2 = point(2);
gradient(1) = 2*x1 - 2 + 4*penalty*(x1^3 + x2^2 * x1 -x1);     
gradient(2) = 4*x2 - 8 + 4*penalty*x2*(x1^2 + x2^2 - 1);

end

