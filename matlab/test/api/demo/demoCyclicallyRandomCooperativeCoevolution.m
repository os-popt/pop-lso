clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoCyclicallyRandomCooperativeCoevolution.m >demoCyclicallyRandomCooperativeCoevolution.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poCyclicallyRandomCooperativeCoevolution';
seedOptimization = 09040319; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
