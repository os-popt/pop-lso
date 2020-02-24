function y = poAckleyPF(X)
% Benchmark Function: Ackley.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal population size (P) and function dimension (F), respectively.
%       Each row of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a column vector whose length is population size.
%       Each element of y is the fitness of each individual (row) of X.
funcDim = size(X, 2);
y = -20 * exp(-0.2 * (1 / funcDim * sum(X .^ 2, 2)) .^ 0.5) - ...
    exp(1 / funcDim * sum(cos(2 * pi * X), 2)) + 20 + exp(1);
end
