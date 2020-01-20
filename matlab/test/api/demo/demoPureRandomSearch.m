clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoPureRandomSearch.m >demoPureRandomSearch.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poPureRandomSearch';
seedOptimization = 04210115; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
