clear; clc;

%%
tic;
funcName = 'poSchwefel221';
funcDims = [1 : 100 1e3 1e4];
for i = 1 : length(funcDims)
    rng(111111 + i);
    problemParameters = poSetProblemParameters(funcName, funcDims(i), 5);
    poGenerateShiftVector(problemParameters);
end
toc;
