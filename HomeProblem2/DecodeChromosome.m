function x = DecodeChromosome(chromosome, numberOfVariables, variableRange)

nGenes = length(chromosome);
bitsPerVariable = nGenes/numberOfVariables;
x = zeros(numberOfVariables, 1);            % Preallocate for performance.

for i = 1:numberOfVariables
    x(i) = 0.0;
    for j = 1:bitsPerVariable
        % First iteration should take bits 1-bitsPerVariable, second 
        % iteration should take bits bitsPerVariable-2*bitsPerVariable etc.
        
        startOfVariable = (i-1) * bitsPerVariable;
        x(i) = x(i) + chromosome(startOfVariable + j)*2^(-j);
    end
    x(i) = -variableRange + 2*variableRange*x(i)/(1-2^(-bitsPerVariable));
end
end

