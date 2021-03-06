function y = poRotatedRosenbrock(X)
% Benchmark Function: Rotated Rosenbrock.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal function dimension (F) and population size (P), respectively.
%       Each column of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a row vector whose length is population size.
%       Each element of y is the fitness of each individual (column) of X.
funcDim = size(X, 1);
if funcDim < 2
    error('`size(X, 1)` should be greater than 1.');
end
persistent poRotationMatrix;
if isempty(poRotationMatrix) || any(size(poRotationMatrix) ~= [funcDim funcDim])
    poRotationMatrix = poLoadRotationMatrix('poRosenbrock', funcDim);
end
y = poRosenbrock(poRotationMatrix * X);
end
