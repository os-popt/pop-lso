clear; clc;

%%
problemParameters.name = 'sphere';
problemParameters.dimension = 2;
problemParameters.upperBounds = ones(2, 1);
problemParameters.lowerBounds = zeros(2, 1);
[problemParameters, ...
    name, dimension, ...
    upperBounds, lowerBounds, ...
    initialUpperBounds, initialLowerBounds] = ...
    poCheckProblemParameters(problemParameters);
disp(problemParameters);
disp(name); % sphere
disp(dimension); % 2
disp(upperBounds'); % 1 1
disp(lowerBounds'); % 0 0
disp(initialUpperBounds'); % 1 1
disp(initialLowerBounds'); % 0 0

%% the input `problemParameters` should be a structure scalar.
problemParameters = struct('name', {'func1', 'func2'});
poCheckProblemParameters(problemParameters);

%% `name` should be a field of the input `problemParameters`.
problemParameters = {};
problemParameters.dimension = 2;
poCheckProblemParameters(problemParameters);

% %% `name` should be a character vector or a string scalar.
% problemParameters = {};
% problemParameters.name = [];
% poCheckProblemParameters(problemParameters);

%% `dimension` should be a field of the input `problemParameters`.
problemParameters = {};
problemParameters.name = 'sphere';
poCheckProblemParameters(problemParameters);

%% `dimension` should be a positive integer scalar.
problemParameters = {};
problemParameters.name = 'sphere';
problemParameters.dimension = 0;
poCheckProblemParameters(problemParameters);

%% `upperBounds` should be a field of the input `problemParameters`.
problemParameters = {};
problemParameters.name = 'sphere';
problemParameters.dimension = 2;
poCheckProblemParameters(problemParameters);

%% `lowerBounds` should be a field of the input `problemParameters`.
problemParameters = {};
problemParameters.name = 'sphere';
problemParameters.dimension = 2;
problemParameters.upperBounds = ones(2, 1);
poCheckProblemParameters(problemParameters);

%% `upperBounds` should be greater than `lowerBounds`.
problemParameters = {};
problemParameters.name = 'sphere';
problemParameters.dimension = 2;
problemParameters.upperBounds = ones(2, 1);
problemParameters.lowerBounds = ones(2, 1);
poCheckProblemParameters(problemParameters);
