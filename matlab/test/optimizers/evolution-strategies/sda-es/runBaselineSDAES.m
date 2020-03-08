clear; clc;

%%
rng(1);
opt.x0 = -10 + 20 * rand(10, 1);
opt.sigma0 = 0.2;
opt.stopfitness = 1e-10;
opt.maxFEs = 1e6;
opt.stopsigma = -Inf;
opt.stoptime = 600;
opt.verbose = 0;
rng(202001);
out = SDAES(@poSphere, 10, opt);
disp(out.bestFitness); % 5.2820e-11
disp(out.record(end, 1)); % 1881

%%
rng(2);
opt.x0 = -10 + 20 * rand(10, 1);
opt.sigma0 = 0.2;
opt.stopfitness = 1e-10;
opt.maxFEs = 1e6;
opt.stopsigma = -Inf;
opt.stoptime = 600;
opt.verbose = 0;
rng(202002);
out = SDAES(@poEllipsoid, 10, opt);
disp(out.bestFitness); % 9.9324e-11
disp(out.record(end, 1)); % 120591

%%
rng(3);
opt.x0 = -10 + 20 * rand(10, 1);
opt.sigma0 = 0.2;
opt.stopfitness = 1e-10;
opt.maxFEs = 1e6;
opt.stopsigma = -Inf;
opt.stoptime = 600;
opt.verbose = 0;
rng(202003);
out = SDAES(@poRosenbrock, 10, opt);
disp(out.bestFitness); % 7.1187e-11
disp(out.record(end, 1)); % 5601
