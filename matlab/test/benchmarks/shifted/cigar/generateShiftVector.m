clear; clc;

%%
tic;
funcName = 'poCigar';
funcDims = [1 : 100 1e3 1e4];
for i = 1 : length(funcDims)
    rng(1111 + i);
    problemParameters = poSetProblemParameters(funcName, funcDims(i), 5);
    poGenerateShiftVector(problemParameters);
end
toc;
