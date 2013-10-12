function [pheromoneLevel] = UpdatePheromoneLevels( pheromoneLevel,deltaPheromoneLevel,rho )
pheromoneLevel = pheromoneLevel.*(1-rho) + deltaPheromoneLevel;
end

