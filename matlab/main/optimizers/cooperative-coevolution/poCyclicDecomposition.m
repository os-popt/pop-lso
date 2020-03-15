function optimizerOptions = poCyclicDecomposition(problemParameters, optimizerOptions)
% Cyclic decomposition.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar
%       with the following fields:
%       1. numberElements : number of elements of each partition set,
%           specified as a positive integer scalar. Note that for each
%           partition set, there is the same number of elements except that
%       	the last partition set may have a less number of elements.
% Output <-
%   optimizerOptions : optimizer options, specified as a structure scalar
%       with the following fields:
%       1. partitionSet : partition set, specified as a cell vector.
if ~isfield(optimizerOptions, 'numberElements')
    optimizerOptions.numberElements = 2;
end
numberElements = optimizerOptions.numberElements;
if ~poIsPositiveIntegerScalar(numberElements)
    error('`numberElements` should be a positive integer scalar.');
end

dimension = problemParameters.dimension;
dimensionIndex = 1 : dimension;
partitionSet = cell(ceil(dimension / numberElements), 1);
for p = 1 : length(partitionSet)
    indexes = (1 + (p - 1) * numberElements) : min(dimension, p * numberElements);
    partitionSet{p, 1} = dimensionIndex(indexes);
end
optimizerOptions.partitionSet = partitionSet;
end
