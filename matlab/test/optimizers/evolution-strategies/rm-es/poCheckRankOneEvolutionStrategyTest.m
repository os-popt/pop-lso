clear; clc;

%%
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 5 * 60;
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.populationSize = 7;
optimizerOptions.stepSize = 0.3;
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize] = ...
    poCheckRankOneEvolutionStrategy(problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % 300
disp(thresholdFitness); % 1.0000e-10
disp(populationSize); % 7
disp(stepSize); % 0.3

%%
problemParameters = poSetProblemParameters('poSphere', 10, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize] = ...
    poCheckRankOneEvolutionStrategy(problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % Inf
disp(thresholdFitness); % -Inf
disp(populationSize); % 10
disp(stepSize); % 0.1

%% `populationSize` should be a positive integer scalar (>=4).
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.populationSize = 0;
poCheckRankOneEvolutionStrategy(problemParameters, optimizerOptions);

%% `stepSize` should be a non-negative scalar.
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.stepSize = -1;
poCheckRankOneEvolutionStrategy(problemParameters, optimizerOptions);
