clear; clc;

% first, download two files which are located in
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/shifted/ellipsoid/generateShiftVector.m
%   https://github.com/os-popt/pop-lso/blob/master/matlab/test/benchmarks/rotated/ellipsoid/generateRotationMatrix.m
% into the directory of this script,
% and then, run them before executing this script.

poPlotContour('poRotatedShiftedEllipsoid', ...
    -5 : 0.05 : 5, ...
    -5 : 0.05 : 5, ...
    1e6 * (0 : 0.5 : 7) .^ 2);
