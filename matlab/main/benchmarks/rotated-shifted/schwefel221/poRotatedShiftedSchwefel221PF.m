function y = poRotatedShiftedSchwefel221PF(X)
% Benchmark Function: Rotated Shifted Schwefel221.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal population size (P) and function dimension (F), respectively.
%       Each row of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a column vector whose length is population size.
%       Each element of y is the fitness of each individual (row) of X.
[popSize, funcDim] = size(X);
persistent poRotationMatrix poShiftVector;
if isempty(poRotationMatrix) || any(size(poRotationMatrix) ~= [funcDim funcDim])
    poRotationMatrix = poLoadRotationMatrix('poSchwefel221', funcDim);
end
if isempty(poShiftVector) || any(size(poShiftVector) ~= [popSize funcDim])
    poShiftVector = poLoadShiftVector('poSchwefel221', funcDim);
    poShiftVector = repmat(poShiftVector', popSize, 1);
end
y = poSchwefel221PF((X - poShiftVector) * poRotationMatrix');
end
