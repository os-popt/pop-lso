clear; clc;

%%
rng(202001);
problemParameters = poSetProblemParameters('poSphere', 10, 10);
algoOptions = struct();
algoOptions.seedPopulation = 1;
algoOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
algoOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
algoOptions.thresholdFitness = 1e-10;
searchResults = poPureCovarianceMatrixAdaptationEvolutionStrategy(problemParameters, algoOptions);
disp(searchResults);
%        optimalFitness: 8.8403e-11
%     numberEvaluations: 2591
%      numberIterations: 259
%          stoppingFlag: 'thresholdFitness'
%             numberEig: 259

%%
rng(202002);
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
algoOptions = struct();
algoOptions.seedPopulation = 2;
algoOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
algoOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
algoOptions.thresholdFitness = 1e-10;
searchResults = poPureCovarianceMatrixAdaptationEvolutionStrategy(problemParameters, algoOptions);
disp(searchResults);
%        optimalFitness: 7.9224e-11
%     numberEvaluations: 6711
%      numberIterations: 671
%          stoppingFlag: 'thresholdFitness'
%             numberEig: 671

%%
rng(202003);
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
algoOptions = struct();
algoOptions.seedPopulation = 3;
algoOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
algoOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
algoOptions.thresholdFitness = 1e-10;
searchResults = poPureCovarianceMatrixAdaptationEvolutionStrategy(problemParameters, algoOptions);
disp(searchResults);
%        optimalFitness: 8.4431e-11
%     numberEvaluations: 5911
%      numberIterations: 591
%          stoppingFlag: 'thresholdFitness'
%             numberEig: 591
