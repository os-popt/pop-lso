clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoPureCovarianceMatrixAdaptationEvolutionStrategy.m >demoPureCovarianceMatrixAdaptationEvolutionStrategy.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poPureCovarianceMatrixAdaptationEvolutionStrategy';
seedOptimization = 52430131; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
