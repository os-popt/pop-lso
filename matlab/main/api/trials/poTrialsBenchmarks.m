function poTrialsBenchmarks(optimizer, seedOptimization, numberTrials)
% Trials for running the optimizer on a set of benchmarks.
%
% Input ->
%   optimizer        : optimizer options, specified as a structure scalar.
%   seedOptimization : seed of optimization process, specified as a nonnegative integer scalar.
%   numberTrials     : number of trials, specified as a positive integer scalar.
%                      If no value is specified, then the default is `3`.
startTime = tic;

if nargin < 3
    numberTrials = 3;
end
if ~poIsPositiveIntegerScalar(numberTrials)
    error('the input `numberTrials` should be a positive integer scalar.');
end

% unify the settings of benchmarks and optimizers
names = {'poRotatedShiftedSphere', 'poRotatedShiftedRosenbrock', 'poRotatedShiftedSchwefel221', ...
    'poRotatedShiftedEllipsoid', 'poRotatedShiftedCigar', 'poRotatedShiftedDiscus', ...
    'poRotatedShiftedAckley', 'poRotatedShiftedGriewank', 'poRotatedShiftedRastrigin'};
dimensions = [2 10 100 1000 10000];
maximumRuntimes = [5 30 60 (60 * 6) (60 * 12)] * 60; % seconds
problemParameters = cell(length(names), length(dimensions));
optimizerOptions = cell(length(names), length(dimensions), numberTrials);

% set seed of population initialization
originalSeed = rng(3704); % for reproducibility (MinuteSecond)
seedPopulation = randi(intmax, length(names), length(dimensions), numberTrials);
rng(originalSeed);

% set seed of optimization process
originalSeed = rng(seedOptimization); % for reproducibility (MinuteSecondMonthDay)
seedOptimization = randi(intmax, length(names), length(dimensions), numberTrials);
rng(originalSeed);

for p = 1 : length(names)
    startRunTime = tic;
    fprintf('******* %s :\n', names{p});
    summarySearchResults = cell(length(dimensions), numberTrials);
    for d = 1 : length(dimensions)
        % set problem parameters
        problemParameters{p, d} = poSetProblemParameters(names{p}, dimensions(d), 5);
        for t = 1 : numberTrials
            % set optimizer options
            optimizerOptions{p, d, t} = optimizer;
            optimizerOptions{p, d, t}.maximumEvaluations = 1e5 * dimensions(d);
            optimizerOptions{p, d, t}.maximumRuntime = maximumRuntimes(d);
            optimizerOptions{p, d, t}.thresholdFitness = 1e-10;
            optimizerOptions{p, d, t}.seedPopulation = seedPopulation(p, d, t);
            optimizerOptions{p, d, t}.seedOptimization = seedOptimization(p, d, t);
            
            % run the optimizer
            rng(optimizerOptions{p, d, t}.seedOptimization); % for repeatability
            summarySearchResults{d, t} = feval(optimizer.name, ...
                problemParameters{p, d}, optimizerOptions{p, d, t});
            fprintf('  | D%d - T%d: optimalFitness %9.7e, runtime %9.7e, stoppingFlag - %s.\n', ...
                dimensions(d), t, ...
                summarySearchResults{d, t}.optimalFitness, ...
                summarySearchResults{d, t}.runtime, ...
                summarySearchResults{d, t}.stoppingFlag);
        end
    end
    
    % save search results
    startSaveTime = tic;
    dataFolder = 'poOutputData'; % reserved word of the toolbox
    if exist(dataFolder, 'dir') ~= 7
        mkdir(dataFolder);
    end
    save(sprintf('./%s/%s-%s.mat', dataFolder, names{p}, optimizer.name), ...
        'summarySearchResults', '-v7.3');
    fprintf('  $ running and saving time -> %9.7e + %7.5e seconds.\n', ...
        toc(startRunTime), toc(startSaveTime));
end

runtime = toc(startTime);
fprintf('$ - runtime - $: %9.7e seconds (%7.5E hours).\n', runtime, runtime / 3600);
end
