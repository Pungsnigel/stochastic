% ------------------- Parameters ------------------- %
populationSize      = 20;
nrOfVariables       = 5;
alpha               = 1;
deltaTime           = 1;
varMax              = 30;
varMin              = -varMax;
cognitiveComponent  = 2;
socialComponent     = 2;
vMax                = (varMax - varMin)/deltaTime;
nbrOfRuns           = 1000;
inertia             = 1.4;
inertiaDecRate      = 0.9;
lowerInertiaLimit   = 0.3;

% ----------------- Initialization ----------------- %
[swarmPositions, swarmVelocities] = InitializePopulation(populationSize, nrOfVariables,[varMin, varMax] , alpha, deltaTime);
% Truncation
swarmPositions = round(swarmPositions);
individualBestPositions = swarmPositions;
swarmBestPosition = swarmPositions(1,:);

% ----------------- Main Algorithm ----------------- %
for iIteration = 1:nbrOfRuns
    
    for i=1:populationSize
        particle = swarmPositions(i, :);
        if (ParticleInRange(particle, [varMin, varMax]))
            indFit = EvaluateIndividual(particle);
            fValPBest = EvaluateIndividual(individualBestPositions(i, :));
            fValSBest = EvaluateIndividual(swarmBestPosition);
            if indFit < fValPBest
                individualBestPositions(i, :) = particle;
            end
            if indFit < fValSBest
                swarmBestPosition = particle;
            end
        end
    end
    
    % Update velocities
    swarmVelocities =  UpdateVelocities(...
        swarmVelocities, swarmPositions, individualBestPositions, swarmBestPosition, cognitiveComponent...
        ,socialComponent, deltaTime, inertia, vMax);

        
    % Update position by moving a step with the new velocity
    swarmPositions = UpdatePositions(swarmPositions, swarmVelocities, deltaTime);
    
    % truncation
    swarmPositions = round(swarmPositions);
        
    % Update inertia
    if (inertia > lowerInertiaLimit)
        inertia = 0.9*inertia;
    end
end
swarmBest = EvaluateIndividual(swarmBestPosition);
fprintf('Found minimum %.2f \n', swarmBest);
    