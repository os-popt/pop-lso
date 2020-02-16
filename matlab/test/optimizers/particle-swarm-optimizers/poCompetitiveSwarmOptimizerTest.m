clear; clc;

%%
rng(202001);
problemParameters = poSetProblemParameters('poSphere', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCompetitiveSwarmOptimizer(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 7.3047e-11
%     numberEvaluations: 14300
%      numberIterations: 285
%          stoppingFlag: 'thresholdFitness'

%%
rng(202002);
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCompetitiveSwarmOptimizer(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 9.3381e-11
%     numberEvaluations: 19150
%      numberIterations: 382
%          stoppingFlag: 'thresholdFitness'

%%
rng(202003);
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCompetitiveSwarmOptimizer(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 0.0084
%     numberEvaluations: 1000000
%      numberIterations: 19999
%          stoppingFlag: 'maximumEvaluations'
