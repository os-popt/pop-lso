clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoCyclicCooperativeCoevolution.m >demoCyclicCooperativeCoevolution.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poCyclicCooperativeCoevolution';
seedOptimization = 36180316; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
