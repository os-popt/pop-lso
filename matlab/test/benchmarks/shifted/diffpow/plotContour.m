clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

poPlotContour('poShiftedDiffPow', ...
    -5 : 0.05 : 5, ...
    -5 : 0.05 : 5, ...
    [0 : 2 : 10 20 : 40 : 100] .^ 2);