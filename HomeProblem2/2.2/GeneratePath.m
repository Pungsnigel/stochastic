function [ path ] = GeneratePath(pheromoneLevel, visibility, alpha, beta)
nrOfCities = size(pheromoneLevel,1);

path = zeros(1,nrOfCities);             % Preallocate path-vector for performance.
available = 1:nrOfCities;               % Create list of all unvisited cities

% Precalculate weight of every edge for performance. Operations have to be
% element-wise.
edgeCost = pheromoneLevel.^alpha .* visibility.^beta;

pathPointer = 1;                         % Initiate iterator
start = randi(nrOfCities);               % Get a random city to start from
path(1) = start;                         % Insert start into path
available(start) = [];                   % Remove start from unvisited cities

while(~isempty(available))               % Loop until every city is visited
    currentCity = path(pathPointer);     % Get the current city
    pathPointer = pathPointer + 1;       % Increase iterator
    node = GetNode(available, edgeCost, currentCity);
    path(pathPointer) = node;            % Add city to path.
    available(available == node) = [];   % Remove city from unvisited cities.
end

end

