function [ population ] = InitializePopulation( populationSize, numberOfGenes, mutationProbability)
nearestNeighborPath = GetNearestNeighbourPath(LoadCityLocations);
population = zeros(populationSize,numberOfGenes);

for i = 1:populationSize
    population(i,:) = nearestNeighborPath;
end

for i = 1:5
    for l = populationSize
        individual = population(l,:);
        individual = Mutate(individual, mutationProbability);
        population(l,:) = individual;
    end
end
end


