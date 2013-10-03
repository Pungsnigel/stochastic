function decodedChromosomes = DecodeChromosome( chromosome, nbrOfVars, range )

decodedChromosomes = zeros(1, nbrOfVars);
nbrOfGenes = length(chromosome);
bitsPerVar = nbrOfGenes / nbrOfVars;

for i=1:nbrOfVars
    firstBitInVar = (i-1) * bitsPerVar + 1;
    for j=1:bitsPerVar
       currentGeneIndex = firstBitInVar + j - 1;
       currentGene = chromosome(currentGeneIndex);
       decodedChromosomes(i) = decodedChromosomes(i) + (2^-j) * currentGene;
    end
    decodedChromosomes(i) = decodedChromosomes(i) * (2*range/(1-2^-currentGeneIndex));
    decodedChromosomes(i) = decodedChromosomes(i) - range;
end

end
