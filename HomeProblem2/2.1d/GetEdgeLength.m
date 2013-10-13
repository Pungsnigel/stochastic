function [ edgeLength ] = GetEdgeLength( edge,cityLocation )
from = edge(1);
to   = edge(2);

city1X = cityLocation(from,1);
city1Y = cityLocation(from,2);
city2X = cityLocation(to,1);
city2Y = cityLocation(to,2);

edgeLength = sqrt( (city1X - city2X)^2 + (city1Y - city2Y)^2);
end

