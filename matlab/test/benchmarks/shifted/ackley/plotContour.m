clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

poPlotContour('poShiftedAckley', ...
    -5 : 0.05 : 5, ...
    -5 : 0.05 : 5, ...
    0 : 2 : 14);