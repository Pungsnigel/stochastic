function mutatedChromosome = Mutate(chromosome, mutationProbability)

nGenes = length(chromosome);
mutatedChromosome = chromosome;

for j = 1:nGenes
    r = rand;
    if (r < mutationProbability)
        mutatedChromosome(j) = 1 - chromosome(j);
    end
end

end

