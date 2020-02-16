clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

% $ nohup matlab -nodesktop -nodisplay -nosplash <poCompetitiveSwarmOptimizeTest.m >poCompetitiveSwarmOptimizeTest.out 2>&1 &

%% v.s. 1.09e-21 (from the original paper)
rng(202001);
problemParameters = poSetProblemParameters('poShiftedSphere', 1000, 100);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.populationSize = 500;
optimizerOptions.factor = 0.15;
optimizerOptions.maximumEvaluations = 5000 * problemParameters.dimension;
searchResults = poCompetitiveSwarmOptimizer(problemParameters, optimizerOptions);
disp(searchResults.optimalFitness); % 9.8043e-22 v.s. 1.09e-21
disp(searchResults.numberEvaluations); % 5000000
disp(searchResults.stoppingFlag); % maximumEvaluations
disp(searchResults.runtime); % 243.5584

%% v.s. 1.01e3 (from the original paper)
rng(202002);
problemParameters = poSetProblemParameters('poShiftedRosenbrockV2', 1000, 100);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 2;
optimizerOptions.populationSize = 500;
optimizerOptions.factor = 0.1;
optimizerOptions.maximumEvaluations = 5000 * problemParameters.dimension;
searchResults = poCompetitiveSwarmOptimizer(problemParameters, optimizerOptions);
disp(searchResults.optimalFitness); % 979.7703 v.s. 1.01e3
disp(searchResults.numberEvaluations); % 5000000
disp(searchResults.stoppingFlag); % maximumEvaluations
disp(searchResults.runtime); % 274.1072
