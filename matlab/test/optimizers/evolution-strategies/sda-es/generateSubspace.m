clear; clc;

%% generate 1-d subspace on 2-d search space
populationSize = 2e3;
X = Inf * ones(2, populationSize); % samples
D = [1/sqrt(2) 1/sqrt(2)]'; % eigenvector to generate 1-d subspace
% D = [1/sqrt(2) -1/sqrt(2)]';
stepSize = 3;
for i = 1 : populationSize
    % X(:, i) = stepSize * D * randn(size(D, 2), 1);
    X(:, i) = randn(size(D, 1), 1) + stepSize * D * randn(size(D, 2), 1);
end
plot(X(1, :), X(2, :), 'r.');
xlim([min(X(:)) max(X(:))]);
ylim([min(X(:)) max(X(:))]);
