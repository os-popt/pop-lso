clear; clc;

% first, download two files which are located in
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/shifted/cigar/generateShiftVector.m
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/rotated/cigar/generateRotationMatrix.m
% into the directory of this script,
% and then, run them before executing this script.

poPlotContour('poRotatedShiftedCigar', ...
    -5 : 0.05 : 5, ...
    -5 : 0.05 : 5, ...
    1e6 * (0 : 0.5 : 9) .^ 2);
