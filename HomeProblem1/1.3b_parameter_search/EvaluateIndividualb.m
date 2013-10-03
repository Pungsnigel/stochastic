function fitness = EvaluateIndividualb(x)
x1 = x(1);
x2 = x(2);

g = functionG(x1, x2);
fitness = 1/g;
end


