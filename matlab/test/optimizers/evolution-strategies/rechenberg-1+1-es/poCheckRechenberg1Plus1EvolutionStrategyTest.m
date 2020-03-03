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
    poCheckRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % 300
disp(thresholdFitness); % 1.0000e-10
disp(populationSize); % 1
disp(stepSize); % 0.3

%%
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e7;
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize] = ...
    poCheckRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 20000000
disp(maximumRuntime); % Inf
disp(thresholdFitness); % -Inf
disp(populationSize); % 1
disp(stepSize); % 0.1

%% `stepSize` should be a non-negative scalar.
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e7;
optimizerOptions.stepSize = -0.3;
poCheckRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions);
