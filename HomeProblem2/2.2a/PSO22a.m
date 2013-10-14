% ------------------- Parameters ------------------- %
populationSize      = 20;
nrOfVariables       = 2;
alpha               = 1;
deltaTime           = 1;
xMax                = 10;
xMin                = -xMax;
cognitiveComponent  = 2;
socialComponent     = 2;
vMax                = (xMax - xMin)/deltaTime;
nbrOfRuns           = 400;
inertia             = 1.4;
inertiaDecRate      = 0.9;

% ----------------- Initialization ----------------- %
[swarmPositions, swarmVelocities] = InitializePopulation(populationSize, nrOfVariables,[xMin, xMax] , alpha, deltaTime);
individualBestPositions = swarmPositions;
swarmBestPosition = swarmPositions(1,:);

% ----------------- Main Algorithm ----------------- %
for iIteration = 1:nbrOfRuns
    
    for i=1:populationSize
        particle = swarmPositions(i, :);
        indFit = FunctionF(particle);
        fValPBest = FunctionF(individualBestPositions(i, :));
        fValSBest = FunctionF(swarmBestPosition);
        if indFit < fValPBest
            individualBestPositions(i, :) = particle;
        end
        if indFit < fValSBest
            swarmBestPosition = particle;
            sBestUpdates = sBestUpdates + 1;
        end
    end
    
    % Update velocities
    swarmVelocities =  UpdateVelocities(...
        swarmVelocities, swarmPositions, individualBestPositions, swarmBestPosition, cognitiveComponent...
        ,socialComponent, deltaTime, inertia, vMax);

        
    % Update position by moving a step with the new velocity
    swarmPositions = UpdatePositions(swarmPositions, swarmVelocities, deltaTime);
        
    % Update inertia
    if (inertia > lowerInertiaLimit)
        inertia = 0.9*inertia;
    end
end
swarmBest = FunctionF(swarmBestPosition);
fprintf('Found minimum %.2f at %.2f, %.2f \n', swarmBest, swarmBestPosition(1), swarmBestPosition(2));
    