clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <generateRotationMatrix.m >generateRotationMatrix.out 2>&1 &

%%
startTime = tic;

names = {'poSphere', 'poRosenbrock', 'poSchwefel221', ...
    'poEllipsoid', 'poCigar', 'poDiscus', ...
    'poAckley', 'poGriewank', 'poRastrigin'};
dimensions = [2 10 100 1000 10000];

rng(200201); % % for reproducibility (YearMonthDay)
randSeeds = randi(intmax, length(names), numel(dimensions));

for p = 1 : length(names)
    name = names{p};
    fprintf('******* %s :\n', name);
    for d = 1 : numel(dimensions)
        startRunTime = tic;
        dimension = dimensions(d);
        rng(randSeeds(p, d));
        problemParameters = poSetProblemParameters(name, dimension, 5);
        poGenerateRotationMatrix(problemParameters);
        fprintf('  | D%d : runtime %7.5e.\n', dimension, toc(startRunTime));
    end
end

fprintf('$ - runtime - $: %7.5e seconds.\n', toc(startTime));
