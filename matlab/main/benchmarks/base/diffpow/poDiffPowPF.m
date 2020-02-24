function y = poDiffPowPF(X)
% Benchmark Function: DiffPow.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal population size (P) and function dimension (F), respectively.
%       Each row of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a column vector whose length is population size.
%       Each element of y is the fitness of each individual (row) of X.
funcDim = size(X, 2) - 1;
if funcDim < 1
    error('`size(X, 2)` should be greater than 1.');
end
y = sum(abs(X) .^ (2 + 4 * (0 : funcDim) / funcDim), 2);
end
