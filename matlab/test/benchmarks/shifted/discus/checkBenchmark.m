clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

funcName = 'poShiftedDiscus';

%%
X = poLoadTestCases(2);
y = [4000004 1000001 0 1000001 4000004];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(3);
y = [4000008 1000002 0 1000002 4000008];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(4);
y = [0 1000003 1000003 1000003 1000029 1000029 16000014];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(5);
y = [0 1000004 1000004 1000004 1000054 1000054 25000030];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(6);
y = [0 1000005 1000005 1000005 1000090 1000090 36000055];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(7);
y = [0 1000006 1000006 1000006 1000139 1000139 49000091 91];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
tic;
poAutomaticallyCheckBenchmark(funcName, true);
toc;

%%
% poShiftedDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poShiftedDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poShiftedDiscus : pass the manual checking within the tolerance `1.00e-06`.
% poShiftedDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poShiftedDiscus : pass the manual checking within the tolerance `1.00e-09`.
% poShiftedDiscus : pass the manual checking within the tolerance `1.00e-09`.
% poShiftedDiscus : pass the automatic checking within the tolerance `1.00e-12`.
