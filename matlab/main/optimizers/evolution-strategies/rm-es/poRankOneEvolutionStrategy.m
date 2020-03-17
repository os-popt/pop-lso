function searchResults = poRankOneEvolutionStrategy(...
    problemParameters, optimizerOptions)
% Rank-One Evolution Strategy.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
%
% Reference:
%   Li, Z. and Zhang, Q., 2017.
%   A simple yet efficient evolution strategy for large-scale black-box optimization.
%   IEEE Transactions on Evolutionary Computation, 22(5), pp.637-646.
%   https://ieeexplore.ieee.org/abstract/document/8080257
startTime = tic;

% load and check problem parameters
[problemParameters, name, dimension, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize] = ...
    poCheckRankOneEvolutionStrategy(...
    problemParameters, optimizerOptions);

% initialize population (i.e., X)
X = poInitializePopulation(problemParameters, optimizerOptions);
xMean = X(:, 1);
startEvaluations = tic;
y = feval(name, xMean);
timeEvaluations = toc(startEvaluations);
evaluations = y;
numberEvaluations = 1;

% initialize both the best-so-far fitness and solution
optimalFitness = y;
optimalSolution = xMean;

% strategy parameter setting for recombination (from CMA-ES)
mu = floor(populationSize / 2); % number of parents for recombination
weights = log(mu + 1 / 2) - log(1 : mu)'; % recombination weights
weights = weights / sum(weights); % normalized recombination weights
muEff = sqrt(1 / sum(weights .^ 2));

% strategy parameter setting for covariance matrix adaptation
ccov = 1 / (3 * sqrt(dimension) + 5); % learning rate for covariance matrix adaptation
p = zeros(dimension, 1); % accumulated principal search direction
cc = 2 / (dimension + 7); % learning rate for search direction adaptation

% strategy parameter setting for rank-based step-size adaptation
yBak = y * ones(1, mu);
ranks = 1 : 2 * mu;
rankRate = 0; % accumulated rank rate
cs = 0.3; % learning rate for step-size adaptation

% iteratively optimize
stoppingFlag = 'maximumEvaluations';
numberIterations = 1;
while numberEvaluations < maximumEvaluations
    if toc(startTime) >= maximumRuntime
        stoppingFlag = 'maximumRuntime';
        break;
    end
    
    if optimalFitness <= thresholdFitness
        stoppingFlag = 'thresholdFitness';
        break;
    end
    
    % generate mutated samples (i.e., X) via mirroring,
    %   which is different from the original paper
    X = sqrt(1 - ccov) * randn(dimension, ceil(populationSize / 2)) + ...
        sqrt(ccov) * p * randn(1, ceil(populationSize / 2));
    X = xMean + stepSize * [X -X(:, 1 : floor(populationSize / 2))];
    
    for k = 1 : populationSize
        outOfBound = (X(:, k) > upperBounds) | (X(:, k) < lowerBounds);
        if any(outOfBound)
            X(outOfBound, k) = unifrnd(lowerBounds(outOfBound), upperBounds(outOfBound));
        end
    end
    
    % evaluate fitness of new samples (i.e., y)
    startEvaluations = tic;
    y = feval(name, X);
    timeEvaluations = timeEvaluations + toc(startEvaluations);
    evaluations = cat(2, evaluations, y);
    numberEvaluations = numberEvaluations + populationSize;
    
    % sort and compute weighted mean
    [y, ySortIndex] = sort(y);
    xMeanBak = xMean;
    xMean = X(:, ySortIndex(1 : mu)) * weights; % weighted recombination
    
    % initialize both the best-so-far fitness and solution
    if optimalFitness > y(1)
        optimalFitness = y(1);
        optimalSolution = X(:, ySortIndex(1));
    end
    
    % calculate the principal search direction
    p = (1 - cc) * p + sqrt(cc * (2 - cc)) * ...
        muEff * (xMean - xMeanBak) / stepSize;
    
    % update step-size via rank-based adaptation
    [~, yySortIndex] = sort([yBak y(1 : mu)]);
    previousRanks = ranks(yySortIndex <= mu);
    currentRanks = ranks(yySortIndex > mu);
    rankDiff = (1 / mu) * (previousRanks - currentRanks) * weights;
    rankRate = (1 - cs) * rankRate + cs * (rankDiff - 0.3);
    stepSize = stepSize * exp(rankRate);
    
    yBak = y(1 : mu);
    numberIterations = numberIterations + 1;
end

% return final search results
searchResults.optimalFitness = optimalFitness;
searchResults.optimalSolution = optimalSolution;
searchResults.numberEvaluations = numberEvaluations;
searchResults.numberIterations = numberIterations;
searchResults.timeEvaluations= timeEvaluations;
searchResults.evaluations = evaluations;
searchResults.stoppingFlag = stoppingFlag;
searchResults.stepSize = stepSize;
searchResults.problemParameters = problemParameters;
searchResults.optimizerOptions = optimizerOptions;
searchResults.runtime = toc(startTime);
end
