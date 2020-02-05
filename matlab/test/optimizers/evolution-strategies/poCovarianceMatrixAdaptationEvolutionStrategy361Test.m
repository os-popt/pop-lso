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
searchResults = poCovarianceMatrixAdaptationEvolutionStrategy361(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 5.7314e-11
%     numberEvaluations: 2082

%%
problemParameters = poSetProblemParameters('poEllipsoid', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.seedOptimization = 202002;
rng(optimizerOptions.seedOptimization);
searchResults = poCovarianceMatrixAdaptationEvolutionStrategy361(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 4.1805e-11
%     numberEvaluations: 4422

%%
problemParameters = poSetProblemParameters('poRosenbrock', 10, 10);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 3;
optimizerOptions.maximumEvaluations = 1e5 * problemParameters.dimension;
optimizerOptions.maximumRuntime = 60 * problemParameters.dimension; % seconds
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.seedOptimization = 202003;
rng(optimizerOptions.seedOptimization);
searchResults = poCovarianceMatrixAdaptationEvolutionStrategy361(problemParameters, optimizerOptions);
disp(searchResults);
%        optimalFitness: 8.4040e-11
%     numberEvaluations: 6392
