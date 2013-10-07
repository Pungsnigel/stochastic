function mutatedChromosome = Mutate(chromosome, mutationProbability)

nGenes = length(chromosome);
mutatedChromosome = chromosome;
for j = 1:nGenes
    r = rand;
    if (r < mutationProbability)
        r = fix(rand*nGenes) + 1;
        temp = mutatedChromosome(j);
        mutatedChromosome(j) = mutatedChromosome(r);
        mutatedChromosome(r) = temp;
    end
end

end

