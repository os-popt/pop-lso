clear; clc;

%%
problemParameters = poSetProblemParameters('poSphere', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.seedOptimization = 202001;
rng(optimizerOptions.seedOptimization);
searchResults = poRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 0.0149
%     numberEvaluations: 1000000

%%
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.seedOptimization = 202002;
rng(optimizerOptions.seedOptimization);
searchResults = poRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 304.1673
%     numberEvaluations: 1000000

%%
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.seedOptimization = 202003;
rng(optimizerOptions.seedOptimization);
searchResults = poRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 7.0169
%     numberEvaluations: 1000000
