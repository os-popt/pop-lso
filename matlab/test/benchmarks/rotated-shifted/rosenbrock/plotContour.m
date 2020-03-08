clear; clc;

% first, download two files which are located in
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/shifted/rosenbrock/generateShiftVector.m
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/rotated/rosenbrock/generateRotationMatrix.m
% into the directory of this script,
% and then, run them before executing this script.

poPlotContour('poRotatedRosenbrock', ...
    -2 : 0.01 : 2, ...
    -2 : 0.01 : 2, ...
    [0 2 .^ (0 : 2 : 12)]);
