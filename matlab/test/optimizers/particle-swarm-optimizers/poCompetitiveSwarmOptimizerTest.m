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
%        optimalFitness: 9.8927e-11
%     numberEvaluations: 19700
%      numberIterations: 196
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
%        optimalFitness: 8.2208e-11
%     numberEvaluations: 25700
%      numberIterations: 256
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
%        optimalFitness: 6.6568
%     numberEvaluations: 1000000
%      numberIterations: 9999
%          stoppingFlag: 'maximumEvaluations'
