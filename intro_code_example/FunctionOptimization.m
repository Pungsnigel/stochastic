populationSize                  = 30;
numberOfGenes                   = 70;
crossoverProbability            = 0.8;
mutationProbability             = 0.025;
tournamentSelectionParameter    = 0.75;
variableRange                   = 5.0;
numberOfGenerations             = 100;
numberOfVariables               = 2;
tournamentSize                  = 2;
elitismDegree                   = 1;

% Preallocate for performance.
fitness = zeros(populationSize,1);


population = InitializePopulation(populationSize, numberOfGenes);

% -------------------- Main Algorithm -------------------- %

for iGeneration = 1:numberOfGenerations
    maximumFitness = 0.0; % Assumes non-negative fitness values!
    
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, numberOfVariables, variableRange);
        fitness(i) = EvaluateIndividualb(x);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
            xBest = x;
        end
    end

    tempPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
        
        r = rand;
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1,chromosome2);
            tempPopulation(i,:) = newChromosomePair(1,:);
            tempPopulation(i+1,:) = newChromosomePair(2,:);
        else
            tempPopulation(i,:) = chromosome1;tempPopulation(i+1,:) = chromosome2;
            tempPopulation(i+1,:) = chromosome2;
        end
    end % Loop over population

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end

    % Carry out elitism and update population.
    bestIndividual = population(bestIndividualIndex,:);
    population = InsertBestIndividual(tempPopulation, bestIndividual, elitismDegree);

end % Loop over generations

% Print final result
disp('xBest');
disp(xBest);
disp('maximumFitness');
disp(maximumFitness);
