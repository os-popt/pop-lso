function [optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, factor] = ...
    poCheckCompetitiveSwarmOptimizer(optimizerOptions)
% Check whether all options of competitive swarm optimizer are set properly.
%
% Input ->
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

% load and check optimizer options
[optimizerOptions, ...
    maximumEvaluations, ...
    maximumRuntime, ...
    thresholdFitness] = poCheckOptimizerOptions(optimizerOptions);

% populationSize
if ~isfield(optimizerOptions, 'populationSize')
    optimizerOptions.populationSize = 200;
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
    if populationSize <= 100
        optimizerOptions.factor = 0;
    else
        optimizerOptions.factor = unifrnd(...
            0.14 * log(populationSize) - 0.30, ...
            0.27 * log(populationSize) - 0.51);
    end
end
factor = optimizerOptions.factor;
if ~poIsNonNegativeScalar(factor)
    error('`factor` should be a non-negative scalar.');
end
end
