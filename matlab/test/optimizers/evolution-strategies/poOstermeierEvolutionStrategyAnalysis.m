clear; clc;

%%
figure(1);
a1 = 1.4;
a2 = 1 / a1;
n = [2 10 100 1000 10000];
semilogx(n, a1 .^ sqrt(1 ./ n), '.'); hold on;
semilogx(n, a2 .^ sqrt(1 ./ n), '.');

%%
figure(2);
n = [2 10 100 1000 10000];
for d = n
    z = normrnd(0, 1, [1, 1e3]);
    z = exp(abs(z) - sqrt(2 / pi));
    semilogx(z, z .^ (1 / d), '.'); hold on;
end

%%
rng(10); % sensitivity to the random seed
problemParameters = poSetProblemParameters('poRosenbrock', 30, 2);
optimizerOptions = struct();
optimizerOptions.initialPopulation = zeros(30, 10);
optimizerOptions.maximumEvaluations = 2.4e6;
optimizerOptions.thresholdFitness = 1e-6;
optimizerOptions.populationSize = 10;
searchResults = poOstermeierEvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults);
figure(3);
semilogy(poGetConvergenceCurve(searchResults.evaluations), 'r.');
xlim([0, 2.4e6]); xticks(0 : 4e5 : 2.4e6);
