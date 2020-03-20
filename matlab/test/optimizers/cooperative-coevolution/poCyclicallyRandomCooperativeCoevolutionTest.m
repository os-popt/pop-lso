clear; clc;

%%
rng(202001);
problemParameters = poSetProblemParameters('poSphere', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCyclicallyRandomCooperativeCoevolution(problemParameters, optimizerOptions);
disp(searchResults);
%          optimalFitness: 5.4535e-11
%       numberEvaluations: 68266
%        numberIterations: 67
%            stoppingFlag: 'thresholdFitness'
%     numberSubOptimizers: 333

%%
rng(202002);
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
searchResults = poCyclicallyRandomCooperativeCoevolution(problemParameters, optimizerOptions);
disp(searchResults);
%          optimalFitness: 9.2466e-07
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
searchResults = poCyclicallyRandomCooperativeCoevolution(problemParameters, optimizerOptions);
disp(searchResults);
%          optimalFitness: 0.3499
%       numberEvaluations: 1000004
%        numberIterations: 976
%            stoppingFlag: 'maximumEvaluations'
%     numberSubOptimizers: 4879
