clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoSepCMAES361.m >demoSepCMAES361.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poSepCMAES361';
seedOptimization = 54270218; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
