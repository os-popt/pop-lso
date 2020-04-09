clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

funcName = 'poShiftedCigar';

%%
X = poLoadTestCases(2);
y = [4000004 1000001 0 1000001 4000004];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(3);
y = [8000004 2000001 0 2000001 8000004];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(4);
y = [0 3000001 3000001 3000001 29000001 29000001 14000016];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(5);
y = [0 4000001 4000001 4000001 54000001 54000001 30000025];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(6);
y = [0 5000001 5000001 5000001 90000001 90000001 55000036];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
X = poLoadTestCases(7);
y = [0 6000001 6000001 6000001 139000001 139000001 91000049 91000000];
poManuallyCheckBenchmark(funcName, X, y, true);

%%
tic;
poAutomaticallyCheckBenchmark(funcName, true);
toc;

%%
% poShiftedCigar : pass the manual checking within the tolerance `1.00e-06`.
% poShiftedCigar : pass the manual checking within the tolerance `1.00e-06`.
% poShiftedCigar : pass the manual checking within the tolerance `1.00e-12`.
% poShiftedCigar : pass the manual checking within the tolerance `1.00e-12`.
% poShiftedCigar : pass the manual checking within the tolerance `1.00e-06`.
% poShiftedCigar : pass the manual checking within the tolerance `1.00e-09`.
% poShiftedCigar : pass the automatic checking within the tolerance `1.00e-12`.
