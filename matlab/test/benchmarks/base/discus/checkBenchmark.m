clear; clc;

funcName = 'poDiscus';

%%
X = poLoadTestCases(2);
y = [4000004 1000001 0 1000001 4000004];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(3);
y = [4000008 1000002 0 1000002 4000008];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(4);
y = [0 1000003 1000003 1000003 1000029 1000029 16000014];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(5);
y = [0 1000004 1000004 1000004 1000054 1000054 25000030];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(6);
y = [0 1000005 1000005 1000005 1000090 1000090 36000055];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(7);
y = [0 1000006 1000006 1000006 1000139 1000139 49000091 91];
poManuallyCheckBenchmark(funcName, X, y);

%%
tic;
poAutomaticallyCheckBenchmark(funcName, true);
toc;

%%
% poDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poDiscus : pass the manual checking within the tolerance `1.00e-12`.
% poDiscus : pass the automatic checking within the tolerance `1.00e-12`.
