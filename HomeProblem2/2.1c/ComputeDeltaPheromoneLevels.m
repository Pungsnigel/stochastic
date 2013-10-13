function [ deltaPheromoneLevel ] = ComputeDeltaPheromoneLevels( pathCollection,pathLengthCollection )

nrOfCities = length(LoadCityLocations);
deltaPheromoneLevel = zeros(nrOfCities,nrOfCities);

for individualPath = 1:size(pathCollection,1)
    individualAntPheromone = 1/pathLengthCollection(individualPath);
    for city = 2:size(pathCollection,individualPath)
        to = pathCollection(individualPath,city-1);
        from   = pathCollection(individualPath,city);
        deltaPheromoneLevel(from,to) = deltaPheromoneLevel(from,to) + individualAntPheromone;
    end
    to = pathCollection(individualPath,1);
    from = pathCollection(individualPath,end);
    deltaPheromoneLevel(from,to) = deltaPheromoneLevel(from,to) + individualAntPheromone;
end

end

