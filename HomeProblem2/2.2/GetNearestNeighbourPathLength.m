function [ length ] = GetNearestNeighbourPathLength( cityLocation )
length = 0.0;
nrOfCities = size(cityLocation,1);
visited(1) = randi(nrOfCities);

for iVisited = 1:nrOfCities-1 % Loop untill visited all cities
    bestDistance = inf;
    bestCityIndex = 0;
    currentCity = visited(iVisited);
    
    for iCity = 1:nrOfCities% Find next city
        if(ismember(iCity,visited))
            continue
        end
        
        % Calculate distance between current city and the one searched       
        path = [currentCity, iCity];
        distance = GetPathLength(path, cityLocation);
                
        % If we have not found a distance yet, or the distance is better
        % than any earlier, update the bestDistance and bestCityIndex
        % accordingly.
        if (distance < bestDistance)
            bestDistance = distance;
            bestCityIndex = iCity;
        end
    end
    % Add distance to total path length, and add city to visited.
    length = length + bestDistance;    
    visited(iVisited+1) = bestCityIndex;
end

%Finish by manuelly insert distance between last city and first

path = [bestCityIndex, visited(1)];
distance = GetPathLength(path, cityLocation);
length = length + distance;

end
