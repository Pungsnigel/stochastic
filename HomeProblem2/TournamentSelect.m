function iSelected = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize)


populationSize = size(fitness, 1);

% Preallocate for performance. Use a x*2-vector in order to be able to
% store fitness-values for each individual - makes sorting easier.
tournamentParticipants = zeros(tournamentSize, 2);      

for i = 1:tournamentSize
    tournamentParticipants(i,1) = 1 + fix(rand*populationSize);
    tournamentParticipants(i,2) = fitness(tournamentParticipants(i,1));
end

% Sort by fitness ascending.
tournamentParticipants = sortrows(tournamentParticipants,-2);

for i = 1:tournamentSize
    r = rand;
    if(r < tournamentSelectionParameter)
        iSelected = tournamentParticipants(i,1);
        return
    end
end

% If the loop ends, we know that the individual with the lowest fitness
% value one, hence we return the last element from the sorted vector.
iSelected = tournamentParticipants(tournamentSize, 1);
end
