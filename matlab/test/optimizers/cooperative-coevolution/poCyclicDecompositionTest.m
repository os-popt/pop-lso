clear; clc;

%%
dimensions = 9 : 11;
optimizerOptions = cell(length(dimensions), 1);
for d = 1 : length(dimensions)
    problemParameters.dimension = dimensions(d);
    optimizerOptions{d} = poCyclicDecomposition(problemParameters, struct());
end

%%
dimensions = 9 : 12;
optimizerOptions = cell(length(dimensions), 1);
for d = 1 : length(dimensions)
    problemParameters.dimension = dimensions(d);
    optimizerOption.numberElements = 3;
    optimizerOptions{d} = poCyclicDecomposition(problemParameters, optimizerOption);
end

%%
problemParameters.dimension = 2;
optimizerOption.numberElements = 3;
optimizerOptions = poCyclicDecomposition(problemParameters, optimizerOption);
disp(optimizerOptions.partitionSet'); % [1] [2]
