function PlotIterations( coefficients, iterations )
% Given a vector of points and a polynomial, will plot the polynomial
% and place the points on the resulting line.
%
 
x = linspace(min(iterations)-1,max(iterations)+1,1000);

for j=1:length(x)           % Map interval of points to polynomial
    y(j) = Polynomial(x(j),coefficients);
end
 
for j=1:length(iterations)  % Map iterations to Polynomial
    iterY(j) = Polynomial(iterations(j),coefficients);
end
 
plot(x,y);
hold on;
plot(iterations,iterY,'o');
    
    % Hard coded offsets for apperance.
axis([min(iterations)-1 max(iterations)+1 min(iterY)-2 max(iterY)+2])
    
hold off;
end