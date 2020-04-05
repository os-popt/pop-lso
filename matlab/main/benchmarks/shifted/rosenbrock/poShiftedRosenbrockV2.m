function y = poShiftedRosenbrockV2(X, o)
% Benchmark Function: Shifted Rosenbrock (Version 2).
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal function dimension (F) and population size (P), respectively.
%       Each column of X denotes an independent individual in the population.
%   o : location of the optimal solutions at each coordinate, specified as a scalar.
%       If no value is specified, then the default is `1`.
% Output <-
%   y : Fitness, specified as a row vector whose length is population size.
%       Each element of y is the fitness of each individual (column) of X.
persistent poShiftVector poO;
[funcDim, popSize] = size(X);
if funcDim < 2
    error('`size(X, 1)` should be greater than 1');
end
if nargin < 2
    o = 1;
end

if isempty(poShiftVector) || any(size(poShiftVector) ~= [funcDim popSize]) || ...
        isempty(poO) || (poO ~= o)
    poShiftVector = poLoadShiftVector(sprintf('poRosenbrockV2-O%d', o), funcDim);
    poShiftVector = repmat(poShiftVector, 1, popSize);
    poO = o;
end
y = poRosenbrockV2(X - poShiftVector + o, o);
end
