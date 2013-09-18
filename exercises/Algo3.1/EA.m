function [ result ] = EA( popSize, dimensions, bitPerDim, func)
    individualLength = bitPerDim * dimensions;
    population = randi([0,1],popSize,individualLength);

end

