clear; clc;

%%
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 1e3;
optimizerOptions.maximumRuntime = 60;
optimizerOptions.thresholdFitness = 1e-10;
[optimizerOptions, ...
    maximumEvaluations, ...
    maximumRuntime, ...
    thresholdFitness] = poCheckOptimizerOptions(optimizerOptions);
disp(optimizerOptions);
%     maximumEvaluations: 1000
%         maximumRuntime: 60
%       thresholdFitness: 1.0000e-10
disp(maximumEvaluations); % 1000
disp(maximumRuntime); % 60
disp(thresholdFitness); % 1.0000e-10

%%
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 1e3;
optimizerOptions = poCheckOptimizerOptions(optimizerOptions);
disp(optimizerOptions);
%     maximumEvaluations: 1000
%         maximumRuntime: Inf
%       thresholdFitness: -Inf

%% the input `optimizerOptions` should be a structure scalar.
optimizerOptions = struct('maximumEvaluations', {1e3 1e5});
poCheckOptimizerOptions(optimizerOptions);

%% `maximumEvaluations` should be a field of the input `optimizerOptions`.
optimizerOptions = struct();
optimizerOptions.maximumRuntime = 60;
poCheckOptimizerOptions(optimizerOptions);

%% `maximumEvaluations` should be a positive integer scalar.
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 0;
optimizerOptions.maximumRuntime = 60;
poCheckOptimizerOptions(optimizerOptions);

%% `maximumRuntime` should be a positive integer scalar.
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 1e5;
optimizerOptions.maximumRuntime = 9.99;
poCheckOptimizerOptions(optimizerOptions);

%% `thresholdFitness` should be a non-NaN scalar.
optimizerOptions = struct();
optimizerOptions.maximumEvaluations = 1e3;
optimizerOptions.maximumRuntime = 60;
optimizerOptions.thresholdFitness = NaN;
poCheckOptimizerOptions(optimizerOptions);
