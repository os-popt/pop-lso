function [optimizerOptions, ...
    maximumEvaluations, ...
    maximumRuntime, ...
    thresholdFitness] = poCheckOptimizerOptions(optimizerOptions)
% Check whether basic optimizer options are set properly.
%
% Input ->
%   optimizerOptions : optimizer options, specified as a structure scalar.
% Output <-
%   optimizerOptions   : optimizer options, specified as a structure scalar.
%   maximumEvaluations : maximum of function evaluations, specified as a positive integer scalar.
%   maximumRuntime     : maximum of runtime, specified as a positive integer scalar.
%                        If no value is specified, then the default is `Inf`.
%   thresholdFitness   : stopping threshold of the best-so-far fitness, specified as a scalar.
%                        If no value is specified, then the default is `-Inf`.
if ~poIsOptimizerOptionsType(optimizerOptions)
    error('the input `optimizerOptions` should be a structure scalar.');
end

% maximumEvaluations
if ~isfield(optimizerOptions, 'maximumEvaluations')
    error('`maximumEvaluations` should be a field of the input `optimizerOptions`.');
end
maximumEvaluations = optimizerOptions.maximumEvaluations;
if ~poIsPositiveIntegerScalar(maximumEvaluations)
    error('`maximumEvaluations` should be a positive integer scalar.');
end

% maximumRuntime
if ~isfield(optimizerOptions, 'maximumRuntime')
    optimizerOptions.maximumRuntime = Inf;
end
maximumRuntime = optimizerOptions.maximumRuntime;
if ~poIsPositiveIntegerScalar(maximumRuntime) && ~isinf(maximumRuntime)
    error('`maximumRuntime` should be a positive integer scalar.');
end

% thresholdFitness
if ~isfield(optimizerOptions, 'thresholdFitness')
    optimizerOptions.thresholdFitness = -Inf;
end
thresholdFitness = optimizerOptions.thresholdFitness;
if ~isscalar(thresholdFitness) || ...
        ~isnumeric(thresholdFitness) || ...
        isnan(thresholdFitness)
    error('`thresholdFitness` should be a non-NaN scalar.');
end
end
