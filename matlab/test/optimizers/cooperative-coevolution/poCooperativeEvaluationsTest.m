clear; clc;

%%
disp(poCooperativeEvaluations(1, 2, 1)); % 1

%%
subX = [-7 7; 2 3]';
optimalSolution = (1 : 3)';
subDimension = [1 3];
subX = poCooperativeEvaluations(subX, optimalSolution, subDimension);
disp(subX);
%     -7     2
%      2     2
%      7     3

%%
subX = [-7 7; 2 3]';
optimalSolution = (1 : 3)';
subDimension = [1 3]';
subX = poCooperativeEvaluations(subX, optimalSolution, subDimension);
disp(subX);
%     -7     2
%      2     2
%      7     3

%%
subX = [-7 7];
optimalSolution = (1 : 3)';
subDimension = 2;
subX = poCooperativeEvaluations(subX, optimalSolution, subDimension);
disp(subX);
%      1     1
%     -7     7
%      3     3
