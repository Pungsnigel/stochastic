% ------------------- Global Variables ------------------- %
populationSize                  = 100;
numberOfGenes                   = 60;
mutationProbability             = 0.025;
tournamentSelectionParameter    = 0.75;
numberOfGenerations             = 100;
numberOfVariables               = 2;
tournamentSize                  = 4;

% Preallocate for performance.
fitness = zeros(populationSize,1);
population = InitializePopulation(populationSize, numberOfGenes);

% -------------------- Main Algorithm -------------------- %

for iGeneration = 1:numberOfGenerations    
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, numberOfVariables, variableRange);
        fitness(i) = EvaluateIndividualb(x);
    end

    tempPopulation = population;

    for i = 1:2:populationSize
        
        i1 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        tempPopulation(i,:)   = population(i1,:);
        tempPopulation(i+1,:) = population(i2,:);
    end % Loop over population

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    % Update population to new generation.
    population = tempPopulation;
    
end % Loop over generations
    