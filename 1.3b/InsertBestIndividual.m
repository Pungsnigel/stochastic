function [ population ] = InsertBestIndividual( tempPopulation, bestIndividual, elitismDegree )

for i = 1:elitismDegree
    tempPopulation(i,:) = bestIndividual;
end

population = tempPopulation;