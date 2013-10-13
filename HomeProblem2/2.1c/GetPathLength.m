function [ pathLength ] = GetPathLength(path,cityLocation)
pathLength = 0.0;

for iCity = 2:length(path)
    from = path(iCity-1);
    to = path(iCity);
    edge = [from, to];

    distance = GetEdgeLength(edge, cityLocation);
    pathLength = pathLength + distance;
end

% Make sure we count the way from last city back to first as well.
from = path(end);
to = path(1);
edge = [from, to];
distance = GetEdgeLength(edge, cityLocation);
pathLength = pathLength + distance;
    
end

