clear; clc;

%%
es = 7 : -1 : 1;
disp(poGetConvergenceCurve(es)); % 7 6 5 4 3 2 1

%%
es = 1 : 7;
disp(poGetConvergenceCurve(es)); % 1 1 1 1 1 1 1

%%
es = [7 6 3 4 5 1 2]';
disp(poGetConvergenceCurve(es)'); % 7 6 3 3 3 1 1
