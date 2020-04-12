clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

funcName = 'poShiftedEllipsoid';

%%
X = poLoadTestCases(2);
y = [4000004 1000001 0 1000001 4000004];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(3);
y = [4004004 1001001 0 1001001 4004004];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(4);
y = [0 1010101 1010101 1010101 16090401 16090401 1040916];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(5);
y = [0 1032655 1032655 1032655 25515092 25515092 1136022];
poManuallyCheckBenchmark(funcName, X, y, true);
% poCheckBenchmarkManually(funcName, X, y, 1, true);

%%
X = poLoadTestCases(6);
y = [0 1067345 1067345 1067345 37643416 37643416 1292664];
poManuallyCheckBenchmark(funcName, X, y, true);
% poCheckBenchmarkManually(funcName, X, y, 1, true);

%%
X = poLoadTestCases(7);
y = [0 1111111 1111111 1111111 52866941 52866941 1508909 38669410];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
tic;
poAutomaticallyCheckBenchmark(funcName, true);
toc;

%%
% poShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-09`.
% poShiftedEllipsoid : NOT pass the manual checking within the tolerance `1.00e-01`.
% poShiftedEllipsoid : NOT pass the manual checking within the tolerance `1.00e-01`.
% poShiftedEllipsoid : pass the manual checking within the tolerance `1.00e-06`.
% poShiftedEllipsoid : pass the automatic checking within the tolerance `1.00e-03`.
