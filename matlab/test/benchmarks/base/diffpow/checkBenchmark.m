clear; clc;

funcName = 'poDiffPow';

%%
X = poLoadTestCases(2);
y = [68 2 0 2 68];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(3);
y = [84 3 0 3 84];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(4);
y = [0 4 4 4 4275.6 4275.6 81.3];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(5);
y = [0 5 5 5 16739 16739 203];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(6);
y = [0 6 6 6 51473.5 51473.5 437.1];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(7);
y = [0 7 7 7 133908.7 133908.7 847.4 52736.8];
poManuallyCheckBenchmark(funcName, X, y);

%%
tic;
poAutomaticallyCheckBenchmark(funcName, true);
toc;

%%
% poDiffPow : pass the manual checking within the tolerance `1.00e-12`.
% poDiffPow : pass the manual checking within the tolerance `1.00e-12`.
% poDiffPow : pass the manual checking within the tolerance `1.00e-01`.
% poDiffPow : pass the manual checking within the tolerance `1.00e-12`.
% poDiffPow : pass the manual checking within the tolerance `1.00e-01`.
% poDiffPow : pass the manual checking within the tolerance `1.00e-01`.
% poDiffPow : pass the automatic checking within the tolerance `1.00e-12`.
