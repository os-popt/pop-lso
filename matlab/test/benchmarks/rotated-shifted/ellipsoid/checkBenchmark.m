clear; clc;

% first, download two files which are located in
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/shifted/ellipsoid/generateShiftVector.m
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/rotated/ellipsoid/generateRotationMatrix.m
% into the directory of this script,
% and then, run them before executing this script.

% $ nohup matlab -nodesktop -nodisplay -nosplash <checkBenchmark.m >checkBenchmark.out 2>&1 &

funcName = 'poRotatedShiftedEllipsoid';

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
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poRotatedShiftedEllipsoid : pass the automatic checking within the tolerance `1.00e-03`.
