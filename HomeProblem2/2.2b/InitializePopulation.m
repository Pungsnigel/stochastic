function [ swarmPositions, swarmVelocities ] = InitializePopulation(populationSize, nrOfVariables, variableRange, alpha, deltaTime)
varMin = variableRange(1);
varMax = variableRange(2);

% Preallocate vectors for performance
swarmPositions  = zeros(populationSize,nrOfVariables);
swarmVelocities = zeros(populationSize,nrOfVariables);

for i = 1:populationSize
    for l = 1:nrOfVariables
        swarmPositions(i,l) = varMin + rand*(varMax - varMin);
        swarmVelocities(i,l) = alpha/deltaTime * ( -(varMax - varMin)/2 + rand*(varMax - varMin) );
    end
end

end

