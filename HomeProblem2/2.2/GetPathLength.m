function [ pathLength ] = GetPathLength(path,cityLocation)
pathLength = 0.0;

for iCity = 2:length(path)
    
    from = path(iCity-1);
    city1X = cityLocation(from,1);
    city1Y = cityLocation(from,2);
    
    to = path(iCity);
    city2X = cityLocation(to,1);
    city2Y = cityLocation(to,2);

    distance = sqrt( (city1X - city2X)^2 + (city1Y - city2Y)^2);
    pathLength = pathLength + distance;
end
    
end

