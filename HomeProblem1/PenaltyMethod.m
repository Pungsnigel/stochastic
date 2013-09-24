startPoint  = [1 2];
T           = 10^-6;
n           = 0.0001;
penalty     = [1, 10, 100, 1000];

fprintf('Running GradientDescent with stepping length %.4f \n', n);

for i=1:length(penalty)
    GradientDescent(startPoint, penalty(i), n, T);
end