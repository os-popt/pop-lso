function [optimizerOptions, ...
    maximumEvaluations, ...
    maximumRuntime, ...
    thresholdFitness, ...
    populationSize, ...
    partitionStrategy, ...
    subOptimizerOptions] = ...
    poCheckCooperativeCoevolution(problemParameters, optimizerOptions)
% Check whether all options of cooperative co-evolution are set properly.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar
%       with the following fields:
%       1. maximumEvaluations  : maximum of function evaluations, specified as a positive integer scalar.
%       2. maximumRuntime      : maximum of runtime, specified as a positive integer scalar.
%                                If no value is specified, then the default is `Inf`.
%       3. thresholdFitness    : stopping threshold of the best-so-far fitness, specified as a scalar.
%                                If no value is specified, then the default is `-Inf`.
%       4. populationSize      : population size, specified as a positive integer scalar.
%                                If no value is specified, then the default is `4 + floor(3 * log(dimension))`.
%       5. partitionStrategy   : partition strategy, specified as a character vector.
%       6. subOptimizerOptions : options of all sub-optimizers, specified as a character vector.
% Output <-
%   optimizerOptions : optimizer options, specified as a structure scalar.

% load and check problem parameters
[~, ~, dimension] = poCheckProblemParameters(problemParameters);

[optimizerOptions, ...
    maximumEvaluations, ...
    maximumRuntime, ...
    thresholdFitness] = poCheckOptimizerOptions(optimizerOptions);

% populationSize
if ~isfield(optimizerOptions, 'populationSize')
    optimizerOptions.populationSize = 4 + floor(3 * log(dimension));
end
populationSize = optimizerOptions.populationSize;
if ~poIsPositiveIntegerScalar(populationSize) || (populationSize < 4)
    error('`populationSize` should be a positive integer scalar (>=4).');
end

% partitionStrategy
partitionStrategy = optimizerOptions.partitionStrategy;

% subOptimizerOptions
subOptimizerOptions = optimizerOptions.subOptimizerOptions;
end
