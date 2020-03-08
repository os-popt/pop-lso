clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoSchwefel1Plus1EvolutionStrategy.m >demoSchwefel1Plus1EvolutionStrategy.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poSchwefel1Plus1EvolutionStrategy';
seedOptimization = 34220301; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
