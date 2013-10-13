function [ node ] = GetNode( available, edgeCost, currentCity )
sumOfEdges = 0;
for city = available
    sumOfEdges = sumOfEdges + edgeCost(currentCity,city);
end

r = rand;

sumOfProbability = 0;
for node = available
    probability = edgeCost(currentCity, node) / sumOfEdges;
    sumOfProbability = sumOfProbability + probability;
    if sumOfProbability > r
        return
    end
end

end

