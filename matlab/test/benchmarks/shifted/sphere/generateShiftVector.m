clear; clc;

%%
tic;
funcName = 'poSphere';
funcDims = [1 : 100 1e3 1e4];
for i = 1 : length(funcDims)
    rng(1 + i);
    problemParameters = poSetProblemParameters(funcName, funcDims(i), 5);
    poGenerateShiftVector(problemParameters);
end
toc;
