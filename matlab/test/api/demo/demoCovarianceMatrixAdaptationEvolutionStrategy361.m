clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoCovarianceMatrixAdaptationEvolutionStrategy361.m >demoCovarianceMatrixAdaptationEvolutionStrategy361.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poCovarianceMatrixAdaptationEvolutionStrategy361';
seedOptimization = 43360211; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
