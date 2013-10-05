function [ population ] = InitializePopulation( populationSize, numberOfGenes)

population = zeros(populationSize,numberOfGenes);
for i = 1:populationSize
    for j = 1:numberOfGenes
        % Find random value in acceptable range that is not currently in
        % individual.
        valueIsInIndividual = true;
        while (valueIsInIndividual)
            valueIsInIndividual = false;
            r = fix(rand*numberOfGenes) + 1;
            if (any(population(i,:)==r))
                valueIsInIndividual = true;
            end
        end
        
        population(i,j) = r;
    end
end
end


