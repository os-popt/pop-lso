clear; clc;

%%
rng(202001);
problemParameters = poSetProblemParameters('poSphere', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poPureRandomSearch(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 14.7455
%     numberEvaluations: 1000000
%      numberIterations: 1000
%          stoppingFlag: 'maximumEvaluations'

%%
rng(202002);
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poPureRandomSearch(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 4.8293e+04
%     numberEvaluations: 1000000
%      numberIterations: 1000
%          stoppingFlag: 'maximumEvaluations'

%%
rng(202003);
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poPureRandomSearch(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 1.0383e+04
%     numberEvaluations: 1000000
%      numberIterations: 1000
%          stoppingFlag: 'maximumEvaluations'
