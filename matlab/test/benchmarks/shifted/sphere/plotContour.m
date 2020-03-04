clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

poPlotContour('poShiftedSphere', ...
    -100 : 0.5 : 100, ...
    -100 : 0.5 : 100, ...
    (0 : 20 : 120) .^ 2);