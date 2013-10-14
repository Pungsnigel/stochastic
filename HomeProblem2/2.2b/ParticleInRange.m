function [ valid ] = ParticleInRange( particle, variableRange )
varMin = variableRange(1);
varMax = variableRange(2);
for i = 1:length(particle)
    if particle(i) < varMin || particle(i) > varMax
        valid = false;
        return
    end
end
valid = true;
end

