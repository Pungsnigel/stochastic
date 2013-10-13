function [ visibility ] = GetVisibility(cityLocation)
nrOfCities = length(cityLocation);
visibility = zeros(nrOfCities, nrOfCities);

for i = 1:nrOfCities
    for l = 1:nrOfCities
        if(i == l) % Avoid getting inf-value, manually set visibility between a city and itself to 0.
            visibility(i,l) = 0;
            continue
        end

        edge = [i,l];
        distance = GetEdgeLength(edge, cityLocation);
        visibility(i,l) = 1/distance;
    end
end

end

