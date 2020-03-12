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
searchResults = poRankOneEvolutionStrategy(...
    problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 6.1294e-11
%     numberEvaluations: 1741

%%
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.seedOptimization = 202002;
rng(optimizerOptions.seedOptimization);
searchResults = poRankOneEvolutionStrategy(...
    problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 9.9466e-11
%     numberEvaluations: 171711

%%
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.seedOptimization = 202003;
rng(optimizerOptions.seedOptimization);
searchResults = poRankOneEvolutionStrategy(...
    problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 9.1893e-11
%     numberEvaluations: 16761
