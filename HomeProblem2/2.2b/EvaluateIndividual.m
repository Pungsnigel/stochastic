function [ fitness ] = EvaluateIndividual( particle )

particle = transpose(particle);
vec      = [15 27 36 18 12];

mat = [  35   -20    -10     32   -10   ; ...
        -20    40    -6     -31   -32   ; ...
        -10   -6      11    -6    -10   ; ...
         32   -31    -6      38   -20   ; ...
        -10    32    -10    -20    31    ];
        
fitness = -vec*particle + transpose(particle) * mat * particle;


end

