clear; clc;

%%
rng(1);
x = unifrnd(-10 * ones(10, 1), 10 * ones(10, 1));
options.Display = 'off';
options.MaxIter = 1988;
options.MaxFunEvals = 2785;
options.TolX = -Inf;
options.TolFun = -Inf;
startTime = tic;
[~, fval, exitflag, output] = fminsearch(@poSphere, x, options);
fprintf('Runtime: %5.2e.\n', toc(startTime));
disp(fval); % 9.6750e-11
disp(exitflag); % 0
disp(output);
%     iterations: 1988
%      funcCount: 2785

%%
rng(2);
x = unifrnd(-10 * ones(10, 1), 10 * ones(10, 1));
options.Display = 'off';
options.MaxIter = 7670;
options.MaxFunEvals = 10720;
options.TolX = -Inf;
options.TolFun = -Inf;
startTime = tic;
[~, fval, exitflag, output] = fminsearch(@poEllipsoid, x, options);
fprintf('Runtime: %5.2e.\n', toc(startTime));
disp(fval); % 9.7755e-11
disp(exitflag); % 0
disp(output);
%     iterations: 7670
%      funcCount: 10720

%%
rng(3);
x = unifrnd(-10 * ones(10, 1), 10 * ones(10, 1));
options.Display = 'off';
options.MaxIter = 4341;
options.MaxFunEvals = 6051;
options.TolX = -Inf;
options.TolFun = -Inf;
startTime = tic;
[~, fval, exitflag, output] = fminsearch(@poRosenbrock, x, options);
fprintf('Runtime: %5.2e.\n', toc(startTime));
disp(fval); % 9.2141e-11
disp(exitflag); % 0
disp(output);
%     iterations: 4341
%      funcCount: 6051
