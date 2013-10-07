function x = DecodeChromosome(chromosome)

cityLocations = LoadCityLocations;
nGenes = length(chromosome);
x = 0.0;

for iCity = 1:nGenes-1
    city1 = chromosome(iCity);
    city2 = chromosome(iCity+1);
    city1X = cityLocations(city1,1);
    city1Y = cityLocations(city1,2);
    city2X = cityLocations(city2,1);
    city2Y = cityLocations(city2,2);
    distance = sqrt((city1X-city2X)^2 + (city1Y-city2Y)^2);
    
    x = x + distance;
end

% Add distance from last to first, to complete the path
city1 = chromosome(nGenes);
city2 = chromosome(1);
city1X = cityLocations(city1,1);
city1Y = cityLocations(city1,2);
city2X = cityLocations(city2,1);
city2Y = cityLocations(city2,2);
distance = sqrt((city1X-city2X)^2 + (city1Y-city2Y)^2);
x = x + distance;

end

