function y = poShiftedDiffPowPF(X)
% Benchmark Function: Shifted DiffPow.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal population size (P) and function dimension (F), respectively.
%       Each row of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a column vector whose length is population size.
%       Each element of y is the fitness of each individual (row) of X.
persistent poShiftVector;
[popSize, funcDim] = size(X);
if funcDim < 2
    error('`size(X, 2)` should be greater than 1.');
end
if isempty(poShiftVector) || any(size(poShiftVector) ~= [popSize funcDim])
    poShiftVector = poLoadShiftVector('poDiffPow', funcDim);
    poShiftVector = repmat(poShiftVector', popSize, 1);
end
y = poDiffPowPF(X - poShiftVector);
end
