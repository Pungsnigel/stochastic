function swarmPositions = UpdatePositions( swarmPositions, swarmVelocities, deltaTime )

populationSize = length(swarmPositions(:, 1));
nrOfVariables = length(swarmPositions(1, :));

for i=1:populationSize
    for j=1:nrOfVariables
       swarmPositions(i, j) = swarmPositions(i, j) + swarmVelocities(i, j) * deltaTime;
    end
end

end

