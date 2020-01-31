function [optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize, ...
    B, D, C, timeEig, numberEig] = ...
    poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions)
% Check whether all options of pure covariance matrix adaptation
%   evolution strategy are set properly.
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
%                               If no value is specified, then the default is
%                               `4 + floor(3 * log(dimension))`.
%       5. stepSize           : step size for mutation, specified as a non-negative scalar.
%                               If no value is specified, then the default is
%                               `0.01 * min(upperBounds - lowerBounds)`.
%       6. covarianceMatrix   : covariance matrix, specified as a `dimension`-by-`dimension` matrix.
%                               If no value is specified, then the default is
%                               `eye(dimension, dimension)`.
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
if ~poIsPositiveIntegerScalar(populationSize)
    error('`populationSize` should be a positive integer scalar.');
end

% stepSize
if ~isfield(optimizerOptions, 'stepSize')
    optimizerOptions.stepSize = 0.01 * min(upperBounds - lowerBounds);
end
stepSize = optimizerOptions.stepSize;
if ~poIsNonNegativeScalar(stepSize)
    error('`stepSize` should be a non-negative scalar.');
end

% covarianceMatrix
if ~isfield(optimizerOptions, 'covarianceMatrix')
    B = eye(dimension, dimension); % coordinate system
    D = ones(dimension, 1); % scaling
    C = B * diag(D .^ 2) * B'; % covariance matrix
    timeEig = 0; % time of eigen decomposition
    numberEig = 0; % number of eigen decomposition
else
    C = optimizerOptions.covarianceMatrix;
    if ~isnumeric(C) || any(size(C) ~= [dimension dimension])
        error('`covarianceMatrix` should be a %d-by-%d matrix.', dimension, dimension);
    end
    if any(isnan(C(:))) || any(isinf(C(:)))
        error('any element of `covarianceMatrix` should not be NaN or Inf.');
    end
    startEig = tic;
    [B, D] = eig(C);
    D = sqrt(diag(D)); % standard deviations
    timeEig = toc(startEig);
    numberEig = 1;
end
end
