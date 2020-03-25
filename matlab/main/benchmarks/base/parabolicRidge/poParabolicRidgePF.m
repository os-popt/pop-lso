function y = poParabolicRidgePF(X)
% Benchmark Function: ParabolicRidge.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal population size (P) and function dimension (F), respectively.
%       Each row of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a column vector whose length is population size.
%       Each element of y is the fitness of each individual (row) of X.
funcDim = size(X, 2);
if funcDim < 2
    error('`size(X, 2)` should be greater than 1.');
end
y = -X(:, 1) + 100 * sum(X(:, 2 : funcDim) .^ 2, 2);
end
