function y = poShiftedDiffPow(X)
% Benchmark Function: Shifted DiffPow.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal function dimension (F) and population size (P), respectively.
%       Each column of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a row vector whose length is population size.
%       Each element of y is the fitness of each individual (column) of X.
persistent poShiftVector;
[funcDim, popSize] = size(X);
if funcDim < 2
    error('`size(X, 1)` should be greater than 1.');
end
if isempty(poShiftVector) || any(size(poShiftVector) ~= [funcDim popSize])
    poShiftVector = poLoadShiftVector('poDiffPow', funcDim);
    poShiftVector = repmat(poShiftVector, 1, popSize);
end
y = poDiffPow(X - poShiftVector);
end
