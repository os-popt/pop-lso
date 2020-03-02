clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoRechenberg1Plus1EvolutionStrategy.m >demoRechenberg1Plus1EvolutionStrategy.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poRechenberg1Plus1EvolutionStrategy';
seedOptimization = 06190221; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
