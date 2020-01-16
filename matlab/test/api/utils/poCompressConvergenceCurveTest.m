clear; clc;

%%
searchResults.evaluations = [7 6 3 4 5 1 2];
searchResults = poCompressConvergenceCurve(searchResults);
disp(searchResults.evaluations);
%      1     2     3     4     5     6     7
%      7     6     3     3     3     1     1

%%
searchResults.evaluations = [7 6 3 4 5 1 2];
searchResults = poCompressConvergenceCurve(searchResults, 3);
disp(searchResults.evaluations);
%      1     3     6     7
%      7     3     1     1

%%
searchResults.evaluations = [7 6 3 4 5 1 0 2];
searchResults = poCompressConvergenceCurve(searchResults, 4);
disp(searchResults.evaluations);
%      1     2     4     6     8
%      7     6     3     1     0
