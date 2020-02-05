function searchResults = poCovarianceMatrixAdaptationEvolutionStrategy361(...
    problemParameters, optimizerOptions)
% Covariance matrix adaptation evolution strategy (version 3.61).
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
%
% Note:
%   This code is based on the file named `cmaes361.m`, downloaded from:
%   https://sites.google.com/site/ecjlmcma/
%   https://sites.google.com/site/ecjlmcma/LMCMA_et_al.ZIP?attredirects=0&revision=1
% Copyright:
%   Nikolaus Hansen
%   http://www.cmap.polytechnique.fr/~nikolaus.hansen/
startTime = tic;

% load and check problem parameters
[problemParameters, name, ~, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize] = ...
    poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);

stepSize = 0.3 * (upperBounds - lowerBounds);

options = poBakCMAES361('defaults');
options.DispModulo = -1;
options.DispFinal = 'off';
options.LogModulo = 0;
options.LogTime = 0;
options.SaveVariables = 'off';
options.ReadSignals = 'off';
options.CMA.active = 1;
options.MaxFunEvals = maximumEvaluations;
options.maximumRuntime = maximumRuntime;
options.StopFitness = thresholdFitness;
options.PopSize = populationSize;
options.UBounds = upperBounds;
options.LBounds = lowerBounds;
options.outfile = 0;

% initialize population (i.e., X)
X = poInitializePopulation(problemParameters, optimizerOptions);

% invoke the optimizer
rng(optimizerOptions.seedOptimization);
[~, ~, counteval, stopflag, out, bestever] = poBakCMAES361(...
    name, X(:, 1), stepSize, options);

% return final search results
searchResults.optimalFitness = bestever.f;
searchResults.optimalSolution = bestever.x;
searchResults.numberEvaluations = counteval;
searchResults.numberIterations = NaN;
searchResults.timeEvaluations= bestever.timeEvaluations;
searchResults.evaluations = bestever.evaluations;
searchResults.stoppingFlag = stopflag;
searchResults.output.out = out;
searchResults.output.bestever = bestever;
searchResults.problemParameters = problemParameters;
searchResults.optimizerOptions = optimizerOptions;
searchResults.runtime = toc(startTime);
end
