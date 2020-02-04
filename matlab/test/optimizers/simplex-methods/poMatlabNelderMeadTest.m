clear; clc;

%%
rng(202001);
problemParameters = poSetProblemParameters('poSphere', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poMatlabNelderMead(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 9.6750e-11
%     numberEvaluations: 2785
%      numberIterations: 1988
%          stoppingFlag: 'thresholdFitness'

%%
rng(202002);
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poMatlabNelderMead(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 9.7755e-11
%     numberEvaluations: 10720
%      numberIterations: 7670
%          stoppingFlag: 'thresholdFitness'

%%
rng(202003);
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poMatlabNelderMead(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 9.2141e-11
%     numberEvaluations: 6051
%      numberIterations: 4341
%          stoppingFlag: 'thresholdFitness'
