clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <demoSearchDirectionAdaptationEvolutionStrategy.m >demoSearchDirectionAdaptationEvolutionStrategy.out 2>&1 &

%%
startTime = tic;
optimizer.name = 'poSearchDirectionAdaptationEvolutionStrategy';
seedOptimization = 16110309; % for reproducibility (MinuteSecondMonthDay)
poDemoBenchmarks(optimizer, seedOptimization);
fprintf('$ - script runtime - $: %9.7e seconds.\n', toc(startTime));
