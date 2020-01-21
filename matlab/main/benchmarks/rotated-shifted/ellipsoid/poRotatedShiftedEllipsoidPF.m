function y = poRotatedShiftedEllipsoidPF(X)
% Benchmark Function: Rotated Shifted Ellipsoid.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal population size (P) and function dimension (F), respectively.
%       Each row of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a column vector whose length is population size.
%       Each element of y is the fitness of each individual (row) of X.
[popSize, funcDim] = size(X);
if funcDim < 2
    error('`size(X, 2)` should be greater than 1.');
end
persistent poRotationMatrix poShiftVector;
if isempty(poRotationMatrix) || any(size(poRotationMatrix) ~= [funcDim funcDim])
    poRotationMatrix = poLoadRotationMatrix('poEllipsoid', funcDim);
end
if isempty(poShiftVector) || any(size(poShiftVector) ~= [popSize funcDim])
    poShiftVector = poLoadShiftVector('poEllipsoid', funcDim);
    poShiftVector = repmat(poShiftVector', popSize, 1);
end
y = poEllipsoidPF((X - poShiftVector) * poRotationMatrix');
end
