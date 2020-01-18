clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <generateRotationMatrix.m >generateRotationMatrix.out 2>&1 &

%%
startRun = tic;
funcName = 'poAckley';
funcDims = [1 : 100 1e3 1e4];

rng(2001130404);
randSeeds = randi(intmax, 1, numel(funcDims));

for i = 1 : numel(funcDims)
    startFuncDim = tic;
    funcDim = funcDims(i);
    rng(randSeeds(i));
    problemParameters = poSetProblemParameters(funcName, funcDim, 5);
    poGenerateRotationMatrix(problemParameters);
    fprintf('funcDim - %d : runtime - %7.5e.\n', funcDim, toc(startFuncDim));
end
fprintf('$ - runtime - $: %7.5e seconds.', toc(startRun));
