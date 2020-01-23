clear; clc;

% first, download two files which are located in
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/shifted/rosenbrock/generateShiftVector.m
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/rotated/rosenbrock/generateRotationMatrix.m
% into the directory of this script,
% and then, run them before executing this script.

% $ nohup matlab -nodesktop -nodisplay -nosplash <checkBenchmark.m >checkBenchmark.out 2>&1 &

funcName = 'poRotatedShiftedRosenbrock';

%%
startTime = tic;
poAutomaticallyCheckBenchmark(funcName);
runtime = toc(startTime);
fprintf('$ - runtime - $: %9.7e seconds (%7.5E hours).\n', runtime, runtime / 3600);

%%
% poRotatedShiftedRosenbrock : pass the automatic checking within the tolerance `1.00e-03`.
