clear; clc;

%%
rng(202001);
problemParameters = poSetProblemParameters('poSphere', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCyclicCooperativeCoevolution(problemParameters, optimizerOptions);
disp(searchResults);
%          optimalFitness: 9.2572e-11
%       numberEvaluations: 45300
%        numberIterations: 45
%            stoppingFlag: 'thresholdFitness'
%     numberSubOptimizers: 221

%%
rng(202002);
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCyclicCooperativeCoevolution(problemParameters, optimizerOptions);
disp(searchResults);
%          optimalFitness: 5.5563e-07
%       numberEvaluations: 1000004
%        numberIterations: 976
%            stoppingFlag: 'maximumEvaluations'
%     numberSubOptimizers: 4879

%%
rng(202003);
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCyclicCooperativeCoevolution(problemParameters, optimizerOptions);
disp(searchResults);
%          optimalFitness: 1.0462e-05
%       numberEvaluations: 1000004
%        numberIterations: 976
%            stoppingFlag: 'maximumEvaluations'
%     numberSubOptimizers: 4879
