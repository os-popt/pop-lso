clear; clc;

funcName = 'poEllipsoid';

%%
X = poLoadTestCases(2);
y = [4000004 1000001 0 1000001 4000004];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(3);
y = [4004004 1001001 0 1001001 4004004];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(4);
y = [0 1010101 1010101 1010101 16090401 16090401 1040916];
poManuallyCheckBenchmark(funcName, X, y);

%%
X = poLoadTestCases(5);
y = [0 1032655 1032655 1032655 25515092 25515092 1136022];
poManuallyCheckBenchmark(funcName, X, y);
% disp(poCheckBenchmarkManually(funcName, X, y, 1));

%%
X = poLoadTestCases(6);
y = [0 1067345 1067345 1067345 37643416 37643416 1292664];
poManuallyCheckBenchmark(funcName, X, y);
% disp(poCheckBenchmarkManually(funcName, X, y, 1));

%%
X = poLoadTestCases(7);
y = [0 1111111 1111111 1111111 52866941 52866941 1508909 38669410];
poManuallyCheckBenchmark(funcName, X, y);

%%
tic;
poAutomaticallyCheckBenchmark(funcName, true);
toc;

%%
% poEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poEllipsoid : NOT pass the manual checking within the tolerance `1.00e-01`.
% poEllipsoid : NOT pass the manual checking within the tolerance `1.00e-01`.
% poEllipsoid : pass the manual checking within the tolerance `1.00e-12`.
% poEllipsoid : pass the automatic checking within the tolerance `1.00e-03`.
