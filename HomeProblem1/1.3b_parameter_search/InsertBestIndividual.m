function [ population ] = InsertBestIndividual( population, bestIndividual, elitismDegree )

for i = 1:elitismDegree
    population(i,:) = bestIndividual;
end

