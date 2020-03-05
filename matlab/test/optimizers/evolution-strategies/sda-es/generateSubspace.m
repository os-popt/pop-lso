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
figure(1);
plot(X(1, :), X(2, :), 'r.');
xlim([min(X(:)) max(X(:))]);
ylim([min(X(:)) max(X(:))]);

%% generate 1-d subspace on 3-d search space
dimension = 3;
populationSize = 2e3;
learningRate = 0.9;
stepSize = 3;
eigenVector = 1/sqrt(3) * ones(dimension, 1); % eigenvector to generate 1-d subspace
X = sqrt(1 - learningRate) * mvnrnd(zeros(dimension, 1), eye(dimension), populationSize)' + ...
    sqrt(learningRate) * stepSize * eigenVector * randn(size(eigenVector, 2), populationSize);
figure(2);
scatter3(X(1, :), X(2, :), X(3, :), 5, 'r', 'filled');
xlim([min(X(:)) max(X(:))]);
ylim([min(X(:)) max(X(:))]);
zlim([min(X(:)) max(X(:))]);
