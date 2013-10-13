function [ path ] = GetNearestNeighbourPath( cityLocation )
nrOfCities = size(cityLocation,1);
path(1) = randi(nrOfCities);

for iVisited = 1:nrOfCities-1 % Loop untill visited all cities
    bestDistance = inf;
    bestCityIndex = 0;
    currentCity = path(iVisited);
    
    for iCity = 1:nrOfCities% Find next city
        if(ismember(iCity,path))
            continue
        end
        
        % Calculate distance between current city and the one searched       
        edge = [currentCity, iCity];
        distance = GetEdgeLength(edge, cityLocation);
                
        % If we have not found a distance yet, or the distance is better
        % than any earlier, update the bestDistance and bestCityIndex
        % accordingly.
        if (distance < bestDistance)
            bestDistance = distance;
            bestCityIndex = iCity;
        end
    end
    % Add city to visited.
    path(iVisited+1) = bestCityIndex;
end


end
