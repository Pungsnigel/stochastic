% ------------------- Global Variables ------------------- %
cityLocations                   = LoadCityLocations;
populationSize                  = 1000;
numberOfGenes                   = length(cityLocations);
mutationProbability             = 0.015;
tournamentSelectionParameter    = 0.75;
numberOfGenerations             = 1000;
tournamentSize                  = 6;

tspFigure = InitializeTspPlot(cityLocations, [0 20 0 20]); 
connection = InitializeConnections(cityLocations);

% Preallocate for performance.
fitness = zeros(populationSize,1);

population = InitializePopulation(populationSize, numberOfGenes);
bestIndividual = population(1,:);
bestFitness = 0.0;

% -------------------- Main Algorithm -------------------- %

for iGeneration = 1:numberOfGenerations 
    % Decode and evaluate current generation
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome);
        fitness(i) = EvaluateIndividual(x);
        if (fitness(i) > bestFitness)
           bestIndividual = population(i,:);
           bestFitness = fitness(i);
        end
    end

    tempPopulation = population;
    
    % Select individuals
    for i = 1:populationSize
        i1 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        tempPopulation(i,:)   = population(i1,:);
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

PlotPath(connection, cityLocations, bestIndividual);    
disp(1/bestFitness);