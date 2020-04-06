clear; clc;

funcName = 'poCigar';

%%
X = poLoadTestCases(2);
y = [4000004 1000001 0 1000001 4000004];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(3);
y = [8000004 2000001 0 2000001 8000004];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(4);
y = [0 3000001 3000001 3000001 29000001 29000001 14000016];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(5);
y = [0 4000001 4000001 4000001 54000001 54000001 30000025];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(6);
y = [0 5000001 5000001 5000001 90000001 90000001 55000036];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(7);
y = [0 6000001 6000001 6000001 139000001 139000001 91000049 91000000];
poManuallyCheckBenchmark(funcName, X, y);

%%
tic;
poAutomaticallyCheckBenchmark(funcName, true);
toc;

%%
% poCigar : pass the manual checking within the tolerance `1.00e-12`.
% poCigar : pass the manual checking within the tolerance `1.00e-12`.
% poCigar : pass the manual checking within the tolerance `1.00e-12`.
% poCigar : pass the manual checking within the tolerance `1.00e-12`.
% poCigar : pass the manual checking within the tolerance `1.00e-12`.
% poCigar : pass the manual checking within the tolerance `1.00e-12`.
% poCigar : pass the automatic checking within the tolerance `1.00e-12`.
