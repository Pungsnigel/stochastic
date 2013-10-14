function velocities = UpdateVelocities( velocities, positions, pBest, sBest, cognitive, social, deltaTime, inertia, vMax)

swarmSize = length(velocities(:, 1));
nrOfVariables = length(positions(1,:));

for i=1:swarmSize
    for l = 1:nrOfVariables
        velOfInd = inertia*velocities(i,l) + rand*cognitive*(pBest(i,l) - positions(i,l))/deltaTime;
        velOfSwarm = rand * social * (sBest(l)-positions(i,l))/deltaTime;
        newVel = velOfInd + velOfSwarm;
        
        if newVel > vMax
            newVel = vMax;
        elseif newVel < -vMax
            newVel = -vMax;
        end
            
        velocities(i,l) = newVel;
    end
end

end



