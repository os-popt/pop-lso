clear; clc;

% first, download two files which are located in
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/shifted/diffpow/generateShiftVector.m
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/rotated/diffpow/generateRotationMatrix.m
% into the directory of this script,
% and then, run them before executing this script.

poPlotContour('poRotatedDiffPow', ...
    -5 : 0.05 : 5, ...
    -5 : 0.05 : 5, ...
    [0 : 1 : 5 20 : 40 : 100] .^ 2);
