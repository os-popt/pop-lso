clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoCompetitiveSwarmOptimizer.m >demoCompetitiveSwarmOptimizer.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poCompetitiveSwarmOptimizer';
seedOptimization = 54180219; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
