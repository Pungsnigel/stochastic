
% ------------------ Parameters fit for testing ------------------ %
populationSize                  = 100;
crossoverProbability            = 1.0;
mutationProbability             = 0.1;
tournamentSelectionParameter    = 0.7;
tournamentSize                  = 4;

% ----------------------- Fixed Parameters ----------------------- %
numberOfGenes                   = 60;
variableRange                   = 5.0;
numberOfGenerations             = 100;
numberOfVariables               = 2;
elitismDegree                   = 1;

% Variables stored only to keep track of avarage values over several runs %
sumOfFunctionValues = 0.0;
sumOfX              = 0.0;
nrOfRuns            = 20;

% Preallocate for performance.
fitness = zeros(populationSize,1);

for iRun = 1:nrOfRuns % Excecute the main algorithm several times.
    
population = InitializePopulation(populationSize, numberOfGenes);

% ----------------------- Main Algorithm ----------------------- %

for iGeneration = 1:numberOfGenerations
    lowerLimit = -variableRange -1;
    maximumFitness = lowerLimit; 
    
    % Evaluate individuals and keep track of best individual in the
    % population
    
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
    
    % Carry out Tournament selection on the population

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
        
        % Do crossover between individuals.
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

    % Loop through population and put every individual through a chance of
    % mutation.
    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end

    % Carry out elitism and update population.
    bestIndividual = population(bestIndividualIndex,:);
    population = InsertBestIndividual(tempPopulation, bestIndividual, elitismDegree);

end % Loop over generations

% Update sums. Since the fitness value is 1/function value, we can get our
% function value by simply taking 1/fitness.
sumOfFunctionValues = sumOfFunctionValues + 1/maximumFitness;
sumOfX              = sumOfX + xBest;

end %Loop over runs

% Count avarage values and print final result.
sumOfFunctionValues = sumOfFunctionValues / nrOfRuns;
sumOfX              = sumOfX / nrOfRuns;

fprintf('Avarage function value over all runs: %.3f at X1: %.3f, X2 %.3f \n',...
sumOfFunctionValues, sumOfX(1), sumOfX(2));
    