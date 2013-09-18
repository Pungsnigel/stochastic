function [ population ] = init( popSize, individualLength )
population = zeros(popSize, individualLength);

for i=1:popSize
    population(i,:) = randi([0,1], 1, individualLength);
end

end

