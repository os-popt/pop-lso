clear; clc;

%%
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 60;
optimizerOptions.thresholdFitness = 1e-10;
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, populationSize] = ...
    poCheckMatlabNelderMead(optimizerOptions);
disp(optimizerOptions);
disp(maximumEvaluations); % 200000
disp(maximumRuntime); % 60
disp(thresholdFitness); % 1.0000e-10
disp(populationSize); % 1

%% `populationSize` should equal 1.
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 2e5;
optimizerOptions.maximumRuntime = 60;
optimizerOptions.thresholdFitness = 1e-10;
optimizerOptions.populationSize = 0;
poCheckMatlabNelderMead(optimizerOptions);
