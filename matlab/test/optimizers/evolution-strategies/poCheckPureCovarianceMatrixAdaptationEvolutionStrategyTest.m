clear; clc;

%%
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 5 * 60;
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.populationSize = 7;
optimizerOptions.stepSize = 0.3;
optimizerOptions.covarianceMatrix = [1 0; 0 1];
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize, ...
    B, D, C, timeEig, numberEig] = ...
    poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % 300
disp(thresholdFitness); % 1.0000e-10
disp(populationSize); % 7
disp(stepSize); % 0.3
disp(B);
%      1     0
%      0     1
disp(D);
%      1
%      1
disp(C);
%      1     0
%      0     1
disp(timeEig);
disp(numberEig); % 1

%%
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize, ...
    B, D, C, timeEig, numberEig] = ...
    poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % Inf
disp(thresholdFitness); % -Inf
disp(populationSize); % 6
disp(stepSize); % 0.1
disp(B);
%      1     0
%      0     1
disp(D);
%      1
%      1
disp(C);
%      1     0
%      0     1
disp(timeEig); % 0
disp(numberEig); % 0

%% `populationSize` should be a positive integer scalar (>=4).
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.populationSize = 0;
poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);

%% `populationSize` should be a positive integer scalar (>=4).
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.populationSize = 3;
poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);

%% `stepSize` should be a non-negative scalar.
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.stepSize = -1;
poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);

%% any element of `covarianceMatrix` should not be NaN or Inf.
problemParameters = poSetProblemParameters('poSphere', 2, 5);
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 5 * 60;
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.covarianceMatrix = [Inf 0; 0 NaN];
poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);
