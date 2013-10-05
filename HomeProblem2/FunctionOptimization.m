% ------------------- Global Variables ------------------- %
populationSize                  = 100;
numberOfGenes                   = length(LoadCityLocations);
mutationProbability             = 0.025;
tournamentSelectionParameter    = 0.75;
numberOfGenerations             = 100;
tournamentSize                  = 4;

% Preallocate for performance.
fitness = zeros(populationSize,1);
population = InitializePopulation(populationSize, numberOfGenes);

% -------------------- Main Algorithm -------------------- %

for iGeneration = 1:numberOfGenerations 
    % Decode and evaluate current generation
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome);
        fitness(i) = EvaluateIndividualb(x);
    end

    tempPopulation = population;
    % Select individuals
    for i = 1:2:populationSize
        
        i1 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        tempPopulation(i,:)   = population(i1,:);
        tempPopulation(i+1,:) = population(i2,:);
    end
    % Mutate selected individuals
    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    % Update population to new generation.
    population = tempPopulation;
    
end % Loop over generations
    