function [optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, factor] = ...
    poCheckCompetitiveSwarmOptimizer(problemParameters, optimizerOptions)
% Check whether all options of competitive swarm optimizer are set properly.
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
%       4. populationSize     : population size, specified as a positive integer scalar.
%                               If no value is specified, then the default is `200`.
%       5. factor             : factor of social learning, specified as a non-negative scalar.
% Output <-
%   optimizerOptions : optimizer options, specified as a structure scalar.

% load and check problem parameters
[~, ~, dimension] = poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, ...
    maximumEvaluations, ...
    maximumRuntime, ...
    thresholdFitness] = poCheckOptimizerOptions(optimizerOptions);

% populationSize
if ~isfield(optimizerOptions, 'populationSize')
    if dimension >= 5000
        optimizerOptions.populationSize = 1500;
    elseif dimension >= 2000
        optimizerOptions.populationSize = 1000;
    elseif dimension >= 1000
        optimizerOptions.populationSize = 500;
    elseif dimension >= 500
        optimizerOptions.populationSize = 200;
    else
        optimizerOptions.populationSize = 100;
    end
end
populationSize = optimizerOptions.populationSize;
if ~poIsPositiveIntegerScalar(populationSize)
    error('`populationSize` should be a positive integer scalar.');
end
if rem(populationSize, 2)
    error('`populationSize` should be an even number.');
end

% factor
if ~isfield(optimizerOptions, 'factor')
    if dimension >= 2000
        optimizerOptions.factor = 0.2;
    elseif dimension >= 1000
        optimizerOptions.factor = 0.1;
    elseif dimension >= 500
        optimizerOptions.factor = 0.05;
    else
        optimizerOptions.factor = 0;
    end
end
factor = optimizerOptions.factor;
if ~poIsNonNegativeScalar(factor)
    error('`factor` should be a non-negative scalar.');
end
end
