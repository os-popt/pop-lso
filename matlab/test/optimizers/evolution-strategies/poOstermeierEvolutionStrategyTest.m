clear; clc;

%%
rng(202001);
problemParameters = poSetProblemParameters('poSphere', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poOstermeierEvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 8.3114e-11
%     numberEvaluations: 8770
%      numberIterations: 877
%          stoppingFlag: 'thresholdFitness'

%%
rng(202002);
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poOstermeierEvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 0.2788
%     numberEvaluations: 1000000
%      numberIterations: 100000
%          stoppingFlag: 'maximumEvaluations'

%%
rng(202003);
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poOstermeierEvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 6.1391e-07
%     numberEvaluations: 1000000
%      numberIterations: 100000
%          stoppingFlag: 'maximumEvaluations'
