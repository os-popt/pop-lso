clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoRankOneEvolutionStrategy.m >demoRankOneEvolutionStrategy.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poRankOneEvolutionStrategy';
seedOptimization = 03410312; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
