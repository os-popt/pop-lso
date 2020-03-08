function searchResults = poSearchDirectionAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions)
% Search Direction Adaptation Evolution Strategy.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
%
% Reference:
%   He, X., Zhou, Y., Chen, zStatistic., Zhang, J. and Chen, W.N., 2019.
%   Large-scale evolution strategy based on search direction adaptation.
%   IEEE Transactions on Cybernetics.
%   https://ieeexplore.ieee.org/abstract/document/8781905
% Note:
%   This code is based on the file named `SDAES_release.m`, downloaded from:
%   https://github.com/hxyokokok/SDAES
%   (commit on 8 Aug 2019)
% Copyright:
%   Xiaoyu He
startTime = tic;

% load and check problem parameters
[problemParameters, name, dimension] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize, numberSearchDirections] = ...
    poCheckSearchDirectionAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);

% initialize population (i.e., X)
X = poInitializePopulation(problemParameters, optimizerOptions);
xMean = X(:, 1);
startEvaluations = tic;
y = feval(name, xMean);
timeEvaluations = toc(startEvaluations);
evaluations = y;
numberEvaluations = 1;

% initialize `optimalSolution` and `optimalFitness`
optimalFitness = y;
optimalSolution = xMean;

% strategy parameter setting for recombination (from CMA-ES)
mu = floor(populationSize / 2); % number of parents for recombination
weights = log(mu + 1 / 2) - log(1 : mu)'; % recombination weights
weights = weights / sum(weights); % normalized recombination weights
muEff = sqrt(1 / sum(weights .^ 2));

% strategy parameter setting for covariance matrix adaptation
ccov = 0.4 / sqrt(dimension); % learning rate for covariance matrix adaptation
cc = 0.25 / sqrt(dimension); % learning rate for search direction adaptation
Q = randn(dimension, numberSearchDirections) * 1e-6; % search directions

% strategy parameter setting for step-size adaptation
cs = 0.3; % learning rate for step-size adaptation
zStatistic = 0;
ranks = 1 : 2 * populationSize;
yBak = y * ones(1, populationSize);

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
    
    % generate mutated samples (i.e., X) via mirroring
    X = sqrt(1 - ccov) * randn(dimension, ceil(populationSize / 2)) + ...
        sqrt(ccov) * Q * randn(numberSearchDirections, ceil(populationSize / 2));
    X = xMean + stepSize * [X -X(:, 1 : floor(populationSize / 2))];
    
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
    
    % update optimalSolution + optimalFitness
    if optimalFitness > y(1)
        optimalFitness = y(1);
        optimalSolution = X(:, ySortIndex(1));
    end
    
    % calculate the first search direction
    z = muEff * (xMean - xMeanBak) / stepSize;
    
    % update all search directions
    for i = 1 : numberSearchDirections
        Q(:, i) = (1 - cc) * Q(:, i) + sqrt(cc * (2 - cc)) * z;
        t = (z' * Q(:, i)) / (Q(:, i)' * Q(:, i));
        z = (z - t * Q(:, i)) / (sqrt(1 + t ^ 2));
    end
    
    % update step-size
    yy = [yBak y]; % merge current and previous population
    [~, yySortIndex] = sort(yy);
    U = sum(ranks(yySortIndex <= populationSize)) - ...
        populationSize * (populationSize + 1) / 2;
    U = (U - populationSize ^ 2 / 2) / ...
        (sqrt(populationSize ^ 2 * (2 * populationSize + 1) / 12));
    zStatistic = (1 - cs) * zStatistic + sqrt(cs * (2 - cs)) * U;
    stepSize = stepSize * exp(normcdf(zStatistic) / 0.95 - 1);
    
    yBak = y;
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
