function [optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize, numberSearchDirections] = ...
    poCheckSearchDirectionAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions)
% Check whether all options of search direction adaptation evolution strategy are set properly.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar
%   optimizerOptions  : optimizer options, specified as a structure scalar
%       with the following fields:
%       1. maximumEvaluations     : maximum of function evaluations, specified as a positive integer scalar.
%       2. maximumRuntime         : maximum of runtime, specified as a positive integer scalar.
%                                   If no value is specified, then the default is `Inf`.
%       3. thresholdFitness       : stopping threshold of the best-so-far fitness, specified as a scalar.
%                                   If no value is specified, then the default is `-Inf`.
%       4. populationSize         : population size, specified as a positive integer scalar.
%                                   If no value is specified, then the default is
%                                   `4 + floor(3 * log(dimension))`.
%       5. stepSize               : step size for mutation, specified as a non-negative scalar.
%                                   If no value is specified, then the default is
%                                   `0.01 * min(upperBounds - lowerBounds)`.
%       6. numberSearchDirections : number of search directions, specified as a positive integer scalar.
%                                   If no value is specified, then the default is `10`.
% Output <-
%   optimizerOptions : optimizer options, specified as a structure scalar.

% load and check problem parameters
[~, ~, dimension, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
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

% stepSize
if ~isfield(optimizerOptions, 'stepSize')
    optimizerOptions.stepSize = 0.01 * min(upperBounds - lowerBounds);
end
stepSize = optimizerOptions.stepSize;
if ~poIsNonNegativeScalar(stepSize)
    error('`stepSize` should be a non-negative scalar.');
end

% numberSearchDirections
if ~isfield(optimizerOptions, 'numberSearchDirections')
    optimizerOptions.numberSearchDirections = min(dimension, 10);
end
numberSearchDirections = optimizerOptions.numberSearchDirections;
if ~poIsPositiveIntegerScalar(numberSearchDirections)
    error('`numberSearchDirections` should be a positive integer scalar.');
end
if numberSearchDirections > dimension
    error('`numberSearchDirections` should not be greater than `dimension`.');
end
end
