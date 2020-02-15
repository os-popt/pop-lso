clear; clc;

%%
rng(0);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 60;
optimizerOptions.thresholdFitness = 1e-10;
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, factor] = poCheckCompetitiveSwarmOptimizer(optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % 60
disp(thresholdFitness); % 1.0000e-10
disp(populationSize); % 200
disp(factor); % 0.8318

%%
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.populationSize = 20;
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, factor] = poCheckCompetitiveSwarmOptimizer(optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % Inf
disp(thresholdFitness); % -Inf
disp(populationSize); % 20
disp(factor); % 0

%% `populationSize` should be a positive integer scalar.
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.populationSize = 0;
poCheckCompetitiveSwarmOptimizer(optimizerOptions);

%% `populationSize` should be an even number.
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.populationSize = 201;
poCheckCompetitiveSwarmOptimizer(optimizerOptions);

%% `factor` should be a non-negative scalar.
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 60;
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.factor = -0.1;
poCheckCompetitiveSwarmOptimizer(optimizerOptions);
