clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <checkBenchmark.m >checkBenchmark.out 2>&1 &

funcName = 'poRotatedShiftedAckley';

%%
startTime = tic;
funcDims = [2 5 7 10 20 50 70 100 1e3 1e4];
for i = 1 : numel(funcDims)
    funcDim = funcDims(i);
    X = zeros(funcDim, randi(1e3));
    y = zeros(1, size(X, 2));
    poManuallyCheckBenchmark(funcName, X, y, true);
end
runtime = toc(startTime);
fprintf('$ - runtime - $: %9.7e seconds (%7.5E hours).\n', runtime, runtime / 3600);

%%
startTime = tic;
poAutomaticallyCheckBenchmark(funcName);
runtime = toc(startTime);
fprintf('$ - runtime - $: %9.7e seconds (%7.5E hours).\n', runtime, runtime / 3600);

%%
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedAckley : pass the automatic checking within the tolerance `1.00e-12`.
