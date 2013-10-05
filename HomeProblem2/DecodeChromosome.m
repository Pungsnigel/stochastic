function x = DecodeChromosome(chromosome)

cityLocations = LoadCityLocations;
nGenes = length(chromosome);
x = 0.0;
for iCity = 1:nGenes
    firstCityX = cityLocation(iCity,1);
    firstCityY = cityLocations(iCity,2);
    secondCityX = cityLocations(iCity+1,1);
    secondCityY = cityLocations(iCity+1,2);
    
    distance = sqrt((firstCityX-secondCityX)^2 + (firstCityY-secondCityY)^2);
    x = x + distance;
end

% Add distance from last to first, to complete the path

end

