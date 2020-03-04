function [optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize] = ...
    poCheckRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions)
% Check whether all options of Rechenberg's (1+1)-evolution strategy are set properly.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar
%   optimizerOptions  : optimizer options, specified as a structure scalar
%       with the following fields:
%       1. maximumEvaluations : maximum of function evaluations, specified as a positive integer scalar.
%       2. maximumRuntime     : maximum of runtime, specified as a positive integer scalar.
%                               If no value is specified, then the default is `Inf`.
%       3. thresholdFitness   : stopping threshold of the best-so-far fitness, specified as a scalar.
%                               If no value is specified, then the default is `-Inf`.
%       4. stepSize           : step size for mutation, specified as a non-negative scalar.
%                               If no value is specified, then the default is
%                               `0.01 * min(upperBounds - lowerBounds)`.
% Output <-
%   optimizerOptions : optimizer options, specified as a structure scalar.

% load and check problem parameters
[~, ~, ~, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, ...
    maximumEvaluations, ...
    maximumRuntime, ...
    thresholdFitness] = poCheckOptimizerOptions(optimizerOptions);

% populationSize
optimizerOptions.populationSize = 1;
populationSize = optimizerOptions.populationSize;

% stepSize
if ~isfield(optimizerOptions, 'stepSize')
    optimizerOptions.stepSize = 0.01 * min(upperBounds - lowerBounds);
end
stepSize = optimizerOptions.stepSize;
if ~poIsNonNegativeScalar(stepSize)
    error('`stepSize` should be a non-negative scalar.');
end
end
