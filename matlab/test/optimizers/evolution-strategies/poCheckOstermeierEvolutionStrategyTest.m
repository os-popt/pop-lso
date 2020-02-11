clear; clc;

%%
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 5 * 60;
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.populationSize = 7;
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize] = ...
    poCheckOstermeierEvolutionStrategy(problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % 300
disp(thresholdFitness); % 1.0000e-10
disp(populationSize); % 7

%%
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e7;
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize] = ...
    poCheckOstermeierEvolutionStrategy(problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 20000000
disp(maximumRuntime); % Inf
disp(thresholdFitness); % -Inf
disp(populationSize); % 6

%% `populationSize` should be a positive integer scalar (>=4).
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e7;
optimizerOptions.populationSize = 3;
poCheckOstermeierEvolutionStrategy(problemParameters, optimizerOptions);
