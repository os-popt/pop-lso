clear; clc;

%%
tic;
funcName = 'poEllipsoid';
funcDims = [1 : 100 1e3 1e4];
for i = 1 : length(funcDims)
    rng(11 + i);
    problemParameters = poSetProblemParameters(funcName, funcDims(i), 5);
    poGenerateShiftVector(problemParameters);
end
toc;
