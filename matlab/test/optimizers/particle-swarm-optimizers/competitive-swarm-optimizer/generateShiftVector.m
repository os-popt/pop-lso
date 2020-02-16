clear; clc;

%%
tic;
funcName = 'poSphere';
funcDim = 1000;
rng(153009);
problemParameters = poSetProblemParameters(funcName, funcDim, 100);
poGenerateShiftVector(problemParameters);
toc;

%%
tic;
funcName = 'poRosenbrock';
funcDim = 1000;
rng(153009 + 1);
problemParameters = poSetProblemParameters(funcName, funcDim, 90);
poGenerateShiftVector(problemParameters);
toc;
