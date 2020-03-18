function optimizerOptions = poCyclicallyRandomDecomposition(...
    problemParameters, optimizerOptions)
% Cyclically random decomposition.
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
dimensionIndex = randperm(dimension);
partitionSet = cell(ceil(dimension / numberElements), 1);
for p = 1 : length(partitionSet)
    indexes = (1 + (p - 1) * numberElements) : min(dimension, p * numberElements);
    partitionSet{p, 1} = sort(dimensionIndex(indexes));
end

if dimension == 2 % for the special case
    if rand <= 0.5
        optimizerOptions.partitionSet = {1; 2};
    else
        optimizerOptions.partitionSet = {2; 1};
    end
else
    optimizerOptions.partitionSet = partitionSet;
end
end
