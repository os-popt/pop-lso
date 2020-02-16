function searchResults = poCompetitiveSwarmOptimizer(...
    problemParameters, optimizerOptions)
% Competitive swarm optimizer.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
%
% Reference:
%   Cheng, R. and Jin, Y., 2014.
%   A competitive swarm optimizer for large scale optimization.
%   IEEE Transactions on Cybernetics, 45(2), pp.191-204.
%   https://ieeexplore.ieee.org/abstract/document/6819057
startTime = tic;

% load and check problem parameters
[problemParameters, name, dimension, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, maximumEvaluations, maximumRuntime, ...
    thresholdFitness, populationSize, factor] = ...
    poCheckCompetitiveSwarmOptimizer(problemParameters, optimizerOptions);
numberCouples = populationSize / 2;

% initialize population/particles (i.e., X + V)
X = poInitializePopulation(problemParameters, optimizerOptions); % positions
V = zeros(dimension, populationSize); % velocities

upperBounds = repmat(upperBounds, 1, populationSize);
lowerBounds = repmat(lowerBounds, 1, populationSize);

% initialize fitness (i.e., y)
startEvaluations = tic;
y = feval(name, X);
timeEvaluations = toc(startEvaluations);
numberEvaluations = populationSize;
evaluations = y;

% initialize `optimalSolution` and `optimalFitness`
[optimalFitness, optimalFitnessIndex] = min(y);
optimalSolution = X(:, optimalFitnessIndex);

% iteratively optimize
numberIterations = 1;
stoppingFlag = 'maximumEvaluations';
while numberEvaluations < maximumEvaluations
    if toc(startTime) >= maximumRuntime
        stoppingFlag = 'maximumRuntime';
        break;
    end
    
    if optimalFitness <= thresholdFitness
        stoppingFlag = 'thresholdFitness';
        break;
    end
    
    % compete
    index = randperm(populationSize);
    winners = [];
    losers = [];
    for k = 1 : numberCouples
        if y(index(k)) <= y(index(k + numberCouples))
            winners = cat(2, winners, index(k));
            losers = cat(2, losers, index(k + numberCouples));
        else
            winners = cat(2, winners, index(k + numberCouples));
            losers = cat(2, losers, index(k));
        end
    end
    
    M = mean(X, 2); % the global mean position of all particles
    M = repmat(M, 1, numberCouples);
    
    V(:, losers) = rand(dimension, numberCouples) .* V(:, losers) + ...
        rand(dimension, numberCouples) .* (X(:, winners) - X(:, losers)) + ...
        factor * rand(dimension, numberCouples) .* (M - X(:, losers));
    X(:, losers) = X(:, losers) + V(:, losers);
    
    outOfBound = (X > upperBounds) | (X < lowerBounds);
    if any(outOfBound)
        X(outOfBound) = unifrnd(lowerBounds(outOfBound), upperBounds(outOfBound));
    end
    
    % evaluate fitness of losers
    startEvaluations = tic;
    y(losers) = feval(name, X(:, losers));
    timeEvaluations = timeEvaluations + toc(startEvaluations);
    numberEvaluations = numberEvaluations + numberCouples;
    evaluations = cat(2, evaluations, y(losers));
    
    % update `optimalSolution` and `optimalFitness`
    [newFitness, newFitnessIndex] = min(y);
    if optimalFitness >= newFitness
        optimalFitness = newFitness;
        optimalSolution = X(:, newFitnessIndex);
    end
    
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
searchResults.problemParameters = problemParameters;
searchResults.optimizerOptions = optimizerOptions;
searchResults.runtime = toc(startTime);
end
