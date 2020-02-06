clear; clc;

%%
options = cmaes361('defaults');
options.DispModulo = -1;
options.DispFinal = 'off';
options.LogModulo = 0;
options.LogTime = 0;
options.SaveVariables = 'off';
options.ReadSignals = 'off';
options.CMA.active = 1;
options.Seed = 202001;
options.MaxFunEvals = 1e5 * 10;
options.StopFitness = 1e-10;
options.UBounds = 10;
options.LBounds = -10;
options.outfile = 0;
options.DiagonalOnly = 1;
rng(1);
x = unifrnd(-10 * ones(10, 1), 10 * ones(10, 1));
rng(options.Seed);
[~, ~, counteval, stopflag, ~, bestever] = cmaes361(...
    'poSphere', x, 0.3 * (options.UBounds - options.LBounds), options);
disp(bestever.f); % 4.1645e-11
disp(counteval); % 1582
disp(stopflag); % 'fitness'

%%
options = cmaes361('defaults');
options.DispModulo = -1;
options.DispFinal = 'off';
options.LogModulo = 0;
options.LogTime = 0;
options.SaveVariables = 'off';
options.ReadSignals = 'off';
options.CMA.active = 1;
options.Seed = 202002;
options.MaxFunEvals = 1e5 * 10;
options.StopFitness = 1e-10;
options.UBounds = 10;
options.LBounds = -10;
options.outfile = 0;
options.DiagonalOnly = 1;
rng(2);
x = unifrnd(-10 * ones(10, 1), 10 * ones(10, 1));
rng(options.Seed);
[~, ~, counteval, stopflag, ~, bestever] = cmaes361(...
    'poEllipsoid', x, 0.3 * (options.UBounds - options.LBounds), options);
disp(bestever.f); % 2.1237e-11
disp(counteval); % 2962
disp(stopflag); % 'fitness'

%%
options = cmaes361('defaults');
options.DispModulo = -1;
options.DispFinal = 'off';
options.LogModulo = 0;
options.LogTime = 0;
options.SaveVariables = 'off';
options.ReadSignals = 'off';
options.CMA.active = 1;
options.Seed = 202003;
options.MaxFunEvals = 1e5 * 10;
options.StopFitness = 1e-10;
options.UBounds = 10;
options.LBounds = -10;
options.outfile = 0;
options.DiagonalOnly = 1;
rng(3);
x = unifrnd(-10 * ones(10, 1), 10 * ones(10, 1));
rng(options.Seed);
[~, ~, counteval, stopflag, ~, bestever] = cmaes361(...
    'poRosenbrock', x, 0.3 * (options.UBounds - options.LBounds), options);
disp(bestever.f); % 9.9557e-11
disp(counteval); % 105172
disp(stopflag); % 'fitness'
